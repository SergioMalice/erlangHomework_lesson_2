%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Июнь 2019 12:33
%%%-------------------------------------------------------------------
-module(p13).
-author("sergeyb").

%% API
-export([decode/1]).
-define(TEST, 1).

% Написать декодер для стандартного алгоритма RLE:
% p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e].
% Вариант с одним элементом, без повторений, вроде как рассматривать не обязательно,
% но произойдет экономия памяти, если в заданном списке много одиночек:
% вызов функции дороже, чем проверка одного доп. условия

decode(List) -> decode(List, []).

decode([], Res) -> reverse(Res, []);
decode([{1,El}|T], Res) -> decode(T, [El|Res]);
decode([{Cnt,El}|T], Res) -> decode(T, duplicate(Cnt,El,Res)).

duplicate(0,_,Res) -> Res;
duplicate(Cnt,El,Res) -> duplicate(Cnt-1, El, [El|Res]).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p13_test() -> ?assert(decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]) =:= [a,a,a,a,b,c,c,a,a,d,e,e,e,e]).

-endif.