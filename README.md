# Paris.es

Paris.es is a plugin for [Paris](https://github.com/emedia-project/paris), allowing you to create controllers with Elixir.

## Installation

In your Paris project, add the following dependency in your `rebar.config` :

```erlang
{paris_ex, ".*", {git, "https://github.com/emedia-project/paris_ex", "master"}},
```

Than add `{plugins, [paris_ex_compiler]}.` at the end of your `rebar.config` file.

Register the plugin in your application configuration. So, open `<app>/config/<app>.config` and add `paris_ex`in the `plugins` list.

Finaly, edit the `<app>/config/vm.args` file and add this line :

```
-pa $BASEDIR/deps/elixir/lib/*/ebin
```

## Usage

See [example](https://github.com/emedia-project/paris_ex/tree/master/example)

## Licences

paris.rb is available for use under the following license, commonly known as the 3-clause (or "modified") BSD license:

Copyright (c) 2014 Gregoire Lejeune [gregoire.lejeune@free.fr]

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.  3. The name of the author may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
