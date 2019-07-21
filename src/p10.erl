-module(p10).
-author("sergeyb").

%% API
-export([encode/1]).

% Запуск всех тестов make tests из корня проекта
%
% encode/1 кодирует список алгоритмом RLE, к примеру
% p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}].
% Критерий поиска дубликатов такой же, как в предыдущих задачах.
% Вместо наполнения результирующего списка дубликатами, храним счетчик их количества.
% Когда элемент меняется, записываем кортеж с количеством и элементом

encode(List) -> encode(List, 1, []).

encode([], _, Res) -> reverse(Res, []);
encode([H,H|T], Cnt, Res) -> encode([H|T], Cnt+1, Res);
encode([A,B|T], Cnt, Res) -> encode([B|T], 1, [{Cnt, A}|Res]);
encode([H|[]], Cnt, Res) -> reverse([{Cnt, H}|Res], []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).