-module(p05).
-author("sergeyb").

%% API
-export([reverse/1]).

% Запуск всех тестов make tests из корня проекта
%
% reverse/1 переворачивает заданный список. К примеру,
% p05:reverse([1,2,3]).
% [3,2,1]

reverse(List) -> reverse(List, []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).