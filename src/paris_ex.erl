-module(paris_ex).

-export([
  type/0,
  call/3
  ]).

type() -> controller.

call(Controller, Fun, Params) when is_atom(Controller), is_atom(Fun), is_list(Params) ->
  ok = application:ensure_started(paris_ex),
  ok = application:ensure_started(elixir),
  case get_controller_module(Controller) of
    {ok, ControllerModule} ->
      {ok, erlang:apply(ControllerModule, Fun, Params)};
    _ -> {error, "Controller not found"}
  end.

get_controller_module(Controller) ->
  ExModuleName = "Elixir." ++ string:join(
      lists:map(fun([H|T]) -> 
            [string:to_upper(H) | string:to_lower(T)] 
        end, string:tokens(atom_to_list(Controller), "_")), ""),
  ExModule = list_to_atom(ExModuleName),
  try ExModule:module_info() of
    _InfoList ->
      {ok, ExModule}
  catch
    _:_ ->
      {error, "Module not found"}
  end.
