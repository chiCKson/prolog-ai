quicksort([Head|Tail],Sorted) :-
pivoting(Head,Tail,Less,Greater),
quicksort(Less,SortedLess),
quicksort(Greater,SortedGreater),
append(SortedLess,[Head|SortedGreater],Sorted).
quicksort([],[]).

pivoting(P,[Head|Tail],[Head|Less],Greater) :-Head =< P,
 pivoting(P,Tail,Less,Greater).
 
pivoting(P,[Head|Tail],Less,[Head|Greater]) :-Head > P,
 pivoting(P,Tail,Less,Greater).
pivoting(_,[],[],[]).
