%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Июнь 2019 12:33
%%%-------------------------------------------------------------------
-module(p14).
-author("sergeyb").

%% API
-export([duplicate/1]).

% Написать дубликатор всех элементов входящего списка:
% p14:duplicate([a,b,c,c,d]).
% [a,a,b,b,c,c,c,c,d,d].
% Проходимся по списку и "размножаем" каждый элемент.
% Выход получается перевернутым, разворачиваем его обратно.

duplicate(List) -> duplicate(List, []).

duplicate([],Res) -> reverse(Res,[]);
duplicate([H|T],Res) -> duplicate(T, [H,H|Res]).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).