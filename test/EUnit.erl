% Запуск всех тестов make tests из корня проекта

-module('EUnit').
-author("sergeyb").

-include_lib("eunit/include/eunit.hrl").

p01_test_() -> [
  ?_assert(p01:last([one, two, three]) =:= three),
  ?_assert(p01:last(["one", "two"]) =:= "two"),
  ?_assert(p01:last([<<"one">>, <<"two">>, <<"three">>]) =:= <<"three">>)
].

p02_test_() -> [
  ?_assert(p02:but_last([one, two, three]) =:= [two, three]),
  ?_assert(p02:but_last(["one", "two"]) =:= ["one", "two"]),
  ?_assert(p02:but_last([<<"one">>, <<"two">>, <<"three">>]) =:= [<<"two">>, <<"three">>])
].

p03_test_() -> [
  ?_assert(p03:element_at([one, two, three], 2) =:= two),
  ?_assert(p03:element_at(["one", "two"], 1) =:= "one"),
  ?_assert(p03:element_at([<<"one">>, <<"two">>, <<"three">>], 3) =:= <<"three">>)
].

p04_test_() -> [
  ?_assert(p04:len([one, two, three]) =:= 3),
  ?_assert(p04:len(["one", "two"]) =:= 2),
  ?_assert(p04:len([<<"one">>, <<"two">>, <<"three">>]) =:= 3)
].

p05_test_() -> [
  ?_assert(p05:reverse([one, two, three]) =:= [three, two, one]),
  ?_assert(p05:reverse(["one", "two"]) =:= lists:reverse(["one", "two"])),
  ?_assert(p05:reverse([<<"one">>, <<"two">>, <<"three">>]) =:= lists:reverse([<<"one">>, <<"two">>, <<"three">>]))
].

p06_test_() -> [
  ?_assert(p06:is_palindrome([1,2,3,2,1]) =:= true),
  ?_assert(p06:is_palindrome([1,2,3]) =:= false)
].

p07_test() -> ?assert(p07:flatten([a,[],[b,[c,d]],e]) =:= [a,b,c,d,e]).

p08_test() -> ?assert(p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [a,b,c,a,d,e]).

p09_test_() -> [
  ?_assert(p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [[a,a,a,a], [b], [c,c], [a,a], [d], [e,e,e,e]]),
  ?_assert(p09:pack([1,2,1,1,3]) =:= [[1], [2], [1,1], [3]]),
  ?_assert(p09:pack([test, test, one, more, time, time]) =:= [[test, test], [one], [more], [time, time]])
].

p10_test() -> ?assert(p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).

p11_test() -> ?assert(p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},b,{2,c},{2,a},d,{4,e}]).

p12_test() -> ?assert(p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]) =:= [a,a,a,a,b,c,c,a,a,d,e,e,e,e]).

p13_test() -> ?assert(p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]) =:= [a,a,a,a,b,c,c,a,a,d,e,e,e,e]).

p14_test_() -> [
  ?_assert(p14:duplicate([a,b,c,c,d]) =:= [a,a,b,b,c,c,c,c,d,d]),
  ?_assert(p14:duplicate([1,2,3]) =:= [1,1,2,2,3,3]),
  ?_assert(p14:duplicate([one, one, two]) =:= [one,one,one,one,two,two])
].

p15_test_() -> [
  ?_assert(p15:replicate([a,b,c,c,d], 1) =:= [a,b,c,c,d]),
  ?_assert(p15:replicate([1,2,3], 2) =:= [1,1,2,2,3,3])
].