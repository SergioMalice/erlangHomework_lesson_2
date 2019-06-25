%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Июнь 2019 19:44
%%%-------------------------------------------------------------------
-module(p03).
-author("sergeyb").

%% API
-export([element_at/2]).

% element_at(List, N) возвращает Nth element списка List
% p03:element_at([a,b,c,d,e,f], 4).
% d
% p03:element_at([a,b,c,d,e,f], 10).
% undefined
% в случае, если N не входит в диапазон 1 .. length(List), возвращаем undefined

element_at([H|_], 1) -> H;
element_at([_|T], N) -> element_at(T, N-1);
element_at([], _) -> undefined.