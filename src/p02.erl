-module(p02).
-author("sergeyb").

%% API
-export([but_last/1]).

% Запуск всех тестов make tests из корня проекта
%
% but_last/1 возвращает два последних элемента заданного списка
% p02:but_last([a,b,c,d,e,f]).
% [e,f]
% last([]) и last([H|[]]) не рассматриваем:
% Let it crush: исходя из условий, два последних элемента в любом случае есть

but_last([_,_|[]] = L) -> L;
but_last([_|T]) -> but_last(T).