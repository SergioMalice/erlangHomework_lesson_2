-module(p11).
-author("sergeyb").

%% API
-export([encode_modified/1]).

% Запуск всех тестов make tests из корня проекта
%
% encode/1 кодирует список при помощи модифицированного алгоритма RLE, к примеру
% p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},b,{2,c},{2,a},d,{4,e}].
% Модифицированный алгоритм из этой задачи отличается от обычного,
% лишь рассмотрением дополнительного случая, когда счетчик равен 1,
% то есть, когда повторений не нашлось - элемент в единственном количестве

encode_modified(List) -> encode_modified(List, 1, []).

encode_modified([], _, Res) -> reverse(Res, []);
encode_modified([H,H|T], Cnt, Res) -> encode_modified([H|T], Cnt+1, Res);
encode_modified([A,B|T], 1, Res) -> encode_modified([B|T], 1, [A|Res]);
encode_modified([A,B|T], Cnt, Res) -> encode_modified([B|T], 1, [{Cnt, A}|Res]);
encode_modified([H|[]], Cnt, Res) -> reverse([{Cnt, H}|Res], []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).