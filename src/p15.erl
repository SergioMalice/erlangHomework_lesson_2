-module(p15).
-author("sergeyb").

%% API
-export([replicate/2]).

% Запуск всех тестов make tests из корня проекта
%
% Написать функцию-репликатор всех элементов входящего списка:
% p15:replicate([a,b,c], 3).
% [a,a,a,b,b,b,c,c,c,d,d,d].
% Использую на каждом элементе списка вспомогательную функцию duplicate из задачи p12,
% размножающую очередной элемент определенное количество раз.
% Для экономии памяти, проверем, равен ли счетчик единице,
% и если так, на выходе получаем нереплицированный список.
% Граница рекурсии - закончились элементы в списке. Выход получаем перевернутый.
% Разворачиваем обратно при помощи reverse/1

replicate(List, 1) -> List;
replicate(List, Cnt) -> replicate(List, Cnt, []).

replicate([], _, Res) -> reverse(Res, []);
replicate([H|T], Cnt, Res) -> replicate(T, Cnt, duplicate(Cnt,H,Res)).

duplicate(0,_,Res) -> Res;
duplicate(Cnt,El,Res) -> duplicate(Cnt-1, El, [El|Res]).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).