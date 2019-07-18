%%%-------------------------------------------------------------------
%%% @author sergeyb
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Июнь 2019 20:14
%%%-------------------------------------------------------------------
-module(p06).
-author("sergeyb").

%% API
-export([is_palindrome/1]).
-define(TEST, 1).

% is_palindrome/1 определяет, является ли заданный список палиндромом
% p06:is_palindrome([1,2,3,2,1]).
% true
% пустой список и список с одним элементом - не палиндром.
% переворачиваем вход, затем сравниваем прямой и перевернутый список.
% По сути - это расширенная версия reverse/1 предыдущего модуля с доп. аргументом для сравнения

is_palindrome([]) -> false;
is_palindrome([_|[]]) -> false;
is_palindrome(List) -> is_palindrome(List, [], List).

is_palindrome([], Rev, Rev) -> true;
is_palindrome([], _Rev, _NotEqual) -> false;
is_palindrome([H|T], Rev, _List) -> is_palindrome(T, [H|Rev], _List).

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
p06_test_() -> [
  ?_assert(is_palindrome([1,2,3,2,1]) =:= true),
  ?_assert(is_palindrome([1,2,3]) =:= false)
].

-endif.