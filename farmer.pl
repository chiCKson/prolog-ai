%state(farmer,wolf,goat,cabbage)
initial_state(state(east,east,east,east)).
goal_state(state(west,west,west,west)).

unsafe(state(X,Y,Y,_)):-opposite(X,Y).
unsafe(state(X,_,Y,Y)):-opposite(X,Y).

move(state(X,X,G,C),action1(X,Y),state(Y,Y,G,C)):-opposite(X,Y),not(unsafe(state(Y,Y,G,C))).
move(state(X,W,X,C),action2(X,Y),state(Y,W,Y,C)):-opposite(X,Y),not(unsafe(state(Y,W,Y,C))).
move(state(X,W,G,X),action3(X,Y),state(Y,W,G,Y)):-opposite(X,Y),not(unsafe(state(Y,W,G,Y))).
move(state(X,W,G,C),action4(X,Y),state(Y,W,G,C)):-opposite(X,Y),not(unsafe(state(Y,W,G,C))).


opposite(east,west).
opposite(west,east).

path(Goal,Goal,List,_):-!.

path(Start,Goal,[H|T],StateList):-move(Start,H,Next_state),
not(member(Next_state,StateList)),
path(Next_state,Goal,T,[Next_state|StateList]),!.

member(X,[X|T]).
member(X,[H|T]):-member(X,T).

write_list([]):-!.
write_list([H|T]):-write_action(H),write_list(T).

write_action(action1(X,Y)):-write('Farmer and wolf cross the river from '),write(X),write(' to '),write(Y),nl.
write_action(action2(X,Y)):-write('Farmer and Goat cross the river from '),write(X),write(' to '),write(Y),nl.
write_action(action3(X,Y)):-write('Farmer and Cabbage cross the river from '),write(X),write(' to '),write(Y),nl.
write_action(action4(X,Y)):-write('Farmer cross the river from '),write(X),write(' to '),write(Y),nl.

go:-initial_state(Start),goal_state(Goal),path(Start,Goal,List,[Start]),write_list(List).