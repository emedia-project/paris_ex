-module(paris_ex_compiler).

-export([pre_compile/2]).

-define(CONSOLE(Str, Args), io:format(Str++"~n", Args)).

pre_compile(Config, _AppFile) ->
  BaseDir = rebar_config:get_xconf(Config, base_dir),
  ExControllers = rebar_utils:find_files("src/controller", ".*\\.ex"),
  if 
    ExControllers =:= [] -> ok;
    true -> compile(BaseDir, ExControllers)
  end.

compile(BaseDir, ExControllers) ->
  lists:foreach(fun(P) ->
        _ = code:add_patha(P)
    end, filelib:wildcard(
      filename:join([BaseDir, "deps", "elixir", "lib", "*", "ebin"]))),
  ok = application:ensure_started(elixir),
  Ebin = rebar_utils:ebin_dir(),
  filelib:ensure_dir(filename:join(Ebin, ".")),
  ExOpts = [{ignore_module_conflict, true}],
  'Elixir.Code':compiler_options(orddict:from_list(ExOpts)),
  Files = [ list_to_binary(F) || F <- ExControllers],
  _ = 'Elixir.Kernel.ParallelCompiler':files_to_path(Files,
                                                     list_to_binary(Ebin),
                                                     [{each_file, fun(F) ->
              ?CONSOLE("Compiled ~s~n",[F])
          end}]),
  ok.
