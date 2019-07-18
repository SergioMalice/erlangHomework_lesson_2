%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Июнь 2019 19:30
%%%-------------------------------------------------------------------
-module(p01).
-author("sergeyb").

%% API
-export([last/1]).
-define(TEST, 1).

% last/1 возвращает последний элемент заданного списка
% p01:last([a,b,c,d,e,f]).
% f
% last([]) не рассматриваем:
% Let it crush: исходя из условий, последний элемент в любом случае есть

last([H|[]]) -> H;
last([_|T]) -> last(T).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p01_test_() -> [
  ?_assert(last([one, two, three]) =:= three),
  ?_assert(last(["one", "two"]) =:= "two"),
  ?_assert(last([<<"one">>, <<"two">>, <<"three">>]) =:= <<"three">>)
].

-endif.