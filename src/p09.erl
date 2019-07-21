-module(p09).
-author("sergeyb").

%% API
-export([pack/1]).

% Запуск всех тестов make tests из корня проекта
%
% pack/1 последовательно запаковывает дубликаты во вложенные списки, к примеру
% p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [[a,a,a,a], [b], [c,c], [a,a], [d], [e,e,e,e]]
% Принцип такой же, как и в предыдущей задаче, за исключением дополнительного
% аккумулятора для формирования списка дубликатов с последующим добавлением
% в результирующий список. Результат получается перевернутый.
% Выводим его наоборот через reverse/1

pack(List) -> pack(List, [], []).

pack([], _, Res) -> reverse(Res, []);
pack([H,H|T], Cur, Res) -> pack([H|T], [H|Cur], Res);
pack([A,B|T], Cur, Res) -> pack([B|T], [], [[A|Cur]|Res]);
pack([H|[]], Cur, Res) -> reverse([[H|Cur]|Res], []).

reverse([], Res) -> Res;
reverse([H|T], Res) -> reverse(T, [H|Res]).