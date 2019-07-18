%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Июнь 2019 18:38
%%%-------------------------------------------------------------------
-module(p08).
-author("sergeyb").

%% API
-export([compress/1]).
-define(TEST, 1).

% compress/1 последовательно удаляет дубликаты входящего списка.
% p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [a,b,c,a,d,e]
% смотрим первые два элемента головы. Если одинаковые -
% рекурсивно запускаем функцию на списке только с одним таким элементом в голове.
% Если разные - "сдвигаем" указатель дальше на один элемент, не забыв сохранить
% в результат уникальный элемент, который будет отброшен на этой итерации.
% Результат получается перевернутый. Выводим его наоборот через reverse/1

compress(List) -> compress(List, []).

compress([], Res) -> reverse(Res, []);
compress([H,H|T], Res) -> compress([H|T], Res);
compress([A,B|T], Res) -> compress([B|T], [A|Res]);
compress([H|[]], Res) -> reverse([H|Res], []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p08_test() -> ?assert(compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [a,b,c,a,d,e]).

-endif.