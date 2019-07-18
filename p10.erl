%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Июнь 2019 12:33
%%%-------------------------------------------------------------------
-module(p10).
-author("sergeyb").

%% API
-export([encode/1]).
-define(TEST, 1).

% encode/1 кодирует список алгоритмом RLE, к примеру
% p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}].
% Критерий поиска дубликатов такой же, как в предыдущих задачах.
% Вместо наполнения результирующего списка дубликатами, храним счетчик их количества.
% Когда элемент меняется, записываем кортеж с количеством и элементом

encode(List) -> encode(List, 1, []).

encode([], _, Res) -> reverse(Res, []);
encode([H,H|T], Cnt, Res) -> encode([H|T], Cnt+1, Res);
encode([A,B|T], Cnt, Res) -> encode([B|T], 1, [{Cnt, A}|Res]);
encode([H|[]], Cnt, Res) -> reverse([{Cnt, H}|Res], []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p10_test() -> ?assert(encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).

-endif.