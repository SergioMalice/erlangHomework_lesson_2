%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Июнь 2019 20:04
%%%-------------------------------------------------------------------
-module(p05).
-author("sergeyb").

%% API
-export([reverse/1]).

% reverse/1 переворачивает заданный список. К примеру,
% p05:reverse([1,2,3]).
% [3,2,1]

reverse(List) -> reverse(List, []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).