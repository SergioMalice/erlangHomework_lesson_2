%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Июнь 2019 12:58
%%%-------------------------------------------------------------------
-module(p07).
-author("sergeyb").

%% API
-export([flatten/1]).

% flatten/1 формирует список из элементов входящего списка,
% вложенных на любом уровне. К примеру,
% p07:flatten([a,[],[b,[c,d]],e]).
% [a,b,c,d,e]
% Отделяем очередной элемент списка и смотрим на хвост.
% Хвост - это список? Если да, (проходит сопоставление с образцом [H|T])
% то рекурсивно разбиваем хвост дальше до тех пор,
% пока в хвосте не останется один элемент (последний), не являющийся списком
% (не сопоставит с [H|T], но сработает сопоставление с H).
% Добавляем его значенение в голову результата, поднимаемся выше по рекурсии.
% Теперь наша цель - предпоследний элемент. И так далее

%%flatten(List) -> flatten(List, []).
%%
%%flatten([], Res) -> Res;
%%flatten([H|T], Res) -> flatten(H, flatten(T, Res));
%%flatten(H, Res) -> [H|Res].

flatten(List) -> reverse(flatten(List, [])).

flatten([H=[_|_]|T], Res) -> flatten(T, flatten(H,Res));
flatten([[]|T], Res) -> flatten(T, Res);
flatten([H|T], Res) -> flatten(T, [H|Res]);
flatten([], Res) -> Res.

reverse(List) -> reverse(List, []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).