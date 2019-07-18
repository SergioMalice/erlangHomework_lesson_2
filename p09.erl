%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Июнь 2019 12:15
%%%-------------------------------------------------------------------
-module(p09).
-author("sergeyb").

%% API
-export([pack/1]).
-define(TEST, 1).

% pack/1 последовательно запаковывает дубликаты во вложенные списки, к примеру
% p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [[a,a,a,a], [b], [c,c], [a,a], [d], [e,e,e,e]]
% Принцип такой же, как и в предыдущей задаче, за исключением дополнительного
% аккумулятора для формирования списка дубликатов с последующим добавлением
% в результирующий список. Результат получается перевернутый.
% Выводим его наоборот через reverse/1

pack(List) -> pack(List, [], []).

pack([], _, Res) -> reverse(Res, []);
pack([H,H|T], Cur, Res) -> pack([H|T], [H|Cur], Res);
pack([A,B|T], Cur, Res) -> pack([B|T], [], [[A|Cur]|Res]);
pack([H|[]], Cur, Res) -> reverse([[H|Cur]|Res], []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p09_test_() -> [
  ?_assert(pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [[a,a,a,a], [b], [c,c], [a,a], [d], [e,e,e,e]]),
  ?_assert(pack([1,2,1,1,3]) =:= [[1], [2], [1,1], [3]]),
  ?_assert(pack([test, test, one, more, time, time]) =:= [[test, test], [one], [more], [time, time]])
].

-endif.