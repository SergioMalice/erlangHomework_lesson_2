%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Июнь 2019 19:50
%%%-------------------------------------------------------------------
-module(p04).
-author("sergeyb").

%% API
-export([len/1]).
-define(TEST, 1).

% len/1 подсчитывает количество элементов в заданном списке
% p04:len([]).
% 0
% p04:len([a,b,c,d]).
% 4
% может работать в приложении с очень большими списками ->
% выбираем хвостовую рекурсию + аккумулятор

len(List) -> len(List, 0).

len([], N) -> N;
len([_|T], N) -> len(T, N+1).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p04_test_() -> [
  ?_assert(len([one, two, three]) =:= 3),
  ?_assert(len(["one", "two"]) =:= 2),
  ?_assert(len([<<"one">>, <<"two">>, <<"three">>]) =:= 3)
].

-endif.