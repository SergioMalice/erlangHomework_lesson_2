-module(p12).
-author("sergeyb").

%% API
-export([decode_modified/1]).

% Запуск всех тестов make tests из корня проекта
%
% Написать декодер для модифицированного алгоритма RLE:
% p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e].
% Декодер рассматривает два варианта - когда встречаем кортеж с повторением,
% и один элемент. Если встретили кортеж - повторяем элемент нужное количество раз.
% Или же записываем его в результирующий список в единственном варианте.

decode_modified(List) -> decode_modified(List, []).

decode_modified([], Res) -> reverse(Res, []);
decode_modified([{Cnt,El}|T], Res) -> decode_modified(T, duplicate(Cnt,El,Res));
decode_modified([El|T], Res) -> decode_modified(T, [El|Res]).

duplicate(0,_,Res) -> Res;
duplicate(Cnt,El,Res) -> duplicate(Cnt-1, El, [El|Res]).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).