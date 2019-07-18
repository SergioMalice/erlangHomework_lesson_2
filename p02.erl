%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Июнь 2019 19:39
%%%-------------------------------------------------------------------
-module(p02).
-author("sergeyb").

%% API
-export([but_last/1]).
-define(TEST, 1).

% but_last/1 возвращает два последних элемента заданного списка
% p02:but_last([a,b,c,d,e,f]).
% [e,f]
% last([]) и last([H|[]]) не рассматриваем:
% Let it crush: исходя из условий, два последних элемента в любом случае есть

but_last([_,_|[]] = L) -> L;
but_last([_|T]) -> but_last(T).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p02_test_() -> [
  ?_assert(but_last([one, two, three]) =:= [two, three]),
  ?_assert(but_last(["one", "two"]) =:= ["one", "two"]),
  ?_assert(but_last([<<"one">>, <<"two">>, <<"three">>]) =:= [<<"two">>, <<"three">>])
].

-endif.