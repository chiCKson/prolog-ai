% Represent a state as state(cannibals_left,missionaries_left,boat_position,cannibals_right,missionaries_right)

initial_state(state(3,3,left,0,0)).
goal_state(state(0,0,right,3,3)).

legal(CL,ML,CR,MR):-
ML>=0,CL>=0,MR>=0,CR>=0,
(ML>=CL;ML=0),(MR>=CR;MR=0).

% two missionaries left to right
move(state(CL,ML,left,CR,MR),action1,state(CL,ML2,right,CR,MR2)):-
MR2 is MR+2,ML2 is ML-2,legal(CL,ML2,CR,MR2).

% two cannibals left to right
move(state(CL,ML,left,CR,MR),action2,state(CL2,ML,right,CR2,MR)):-
CR2 is CR+2,CL2 is CL-2,legal(CL2,ML,CR2,MR).

% one missionaries and one cannibel left to right
move(state(CL,ML,left,CR,MR),action3,state(CL1,ML1,right,CR1,MR1)):-
MR1 is MR+1,CR1 is CR+1,ML1 is ML-1,CL1 is CL-1,legal(CL1,ML1,CR1,MR1).

%one missionarie left to right
move(state(CL,ML,left,CR,MR),action4,state(CL,ML1,right,CR,MR1)):-
MR1 is MR+1,ML1 is ML-1,legal(CL,ML1,CR,MR1).

% one cannibal left to right
move(state(CL,ML,left,CR,MR),action5,state(CL1,ML,right,CR1,MR)):-
CR1 is CR+1,CL1 is CL-1,legal(CL1,ML,CR1,MR).

%--------------------------------------------------------------------------

% two missionaries right to left
move(state(CL,ML,right,CR,MR),action6,state(CL,ML2,left,CR,MR2)):-
MR2 is MR-2,ML2 is ML+2,legal(CL,ML2,CR,MR2).

% two cannibals right to left
move(state(CL,ML,right,CR,MR),action7,state(CL2,ML,left,CR2,MR)):-
CR2 is CR-2,CL2 is CL+2,legal(CL2,ML,CR2,MR).

% one missionaries and one cannibel right to left
move(state(CL,ML,right,CR,MR),action8,state(CL1,ML1,left,CR1,MR1)):-
MR1 is MR-1,CR1 is CR-1,ML1 is ML+1,CL1 is CL+1,legal(CL1,ML1,CR1,MR1).

%one missionarie right to left
move(state(CL,ML,right,CR,MR),action9,state(CL,ML1,left,CR,MR1)):-
MR1 is MR-1,ML1 is ML+1,legal(CL,ML1,CR,MR1).

% one cannibal right to left
move(state(CL,ML,right,CR,MR),action10,state(CL1,ML,left,CR1,MR)):-
CR1 is CR-1,CL1 is CL+1,legal(CL1,ML,CR1,MR).

path(Goal,Goal,List,_):-!.

path(Start,Goal,[H|T],StateList):-move(Start,H,Next_state),
not(member(Next_state,StateList)),
path(Next_state,Goal,T,[Next_state|StateList]),!.

member(X,[X|T]).
member(X,[H|T]):-member(X,T).

write_list([]):-!.
write_list([H|T]):-write_action(H),write_list(T).

write_action(action1):-write('Two missionaries cross the river to right'),nl.
write_action(action2):-write('Two Cannibales cross the river to right '),nl.
write_action(action3):-write('One missionaries and one canibales cross the river to right'),nl.
write_action(action4):-write('One missionarie cross the river to right'),nl.
write_action(action5):-write('One cannibale cross the river to right'),nl.
write_action(action6):-write('Two missionaries cross the river to left'),nl.
write_action(action7):-write('Two Cannibales cross the river to left '),nl.
write_action(action8):-write('One missionaries and one canibales cross the river to left'),nl.
write_action(action9):-write('One missionarie cross the river to left'),nl.
write_action(action10):-write('One cannibale cross the river to left'),nl.

go:-initial_state(Start),goal_state(Goal),path(Start,Goal,List,[Start]),write_list(List).