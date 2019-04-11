
fact(0,Result) :-
    Result is 1.
fact(N,Result) :-
    N > 0,
    N1 is N-1,
    fact(N1,Result1),
    Result is Result1*N.

last(X,[X]).
last(X,[_|Tail]) :- last(X,Tail).

find_nth_element_of_list( 0,X,[X|_]) .
find_nth_element_of_list(N,X,[_|Xs]) :-
  N > 0 ,
  N1 is N-1 ,
  find_nth_element_of_list(N1,X,Xs).





palindrome(Xs):-palind(Xs),write('it is a palindrome').
palind([]) .
palind(Xs) :- append([X|Rest],[X],Xs),palind(Rest).

reverse([],[]).  
reverse([X|Xs],R):-reverse(Xs,T),append(T,[X],R).

fib(0, 1).
fib(1, 1).
fib(N, Result) :- N1 is N - 1,
N2 is N - 2, fib(N1, Result1),
fib(N2, Result2), Result is Result1 + Result2.


%TOWER OF HANOI
%Call it by ---> move(3,left,right,center)
move(1,X,Y,_) :-  
    write('Move top disk from '), 
    write(X), 
    write(' to '), 
    write(Y), 
    nl. 
move(N,X,Y,Z) :- 
    N>1, 
    M is N-1, 
    move(M,X,Z,Y), 
    move(1,X,Y,_), 
    move(M,Z,Y,X).




