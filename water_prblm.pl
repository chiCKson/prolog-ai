intial_state(state(0,0)).
goal_state(state(4,_)).

%fill(start_state_of_jugs,action1-6,final_state_of_jugs).
fill(state(0,0),action1,state(5,0)).
fill(state(5,0),action2,state(2,3)).
fill(state(2,3),action3,state(2,0)).
fill(state(2,0),action4,state(0,2)).
fill(state(0,2),action5,state(5,2)).
fill(state(5,2),action6,state(4,3)).

can_fill(Goal,Goal,[]):-!.
can_fill(Start,Goal,[H|T]):-fill(Start,H,Next_state),can_fill(Next_state,Goal,T).

write_action_list([]):-!.
write_action_list([H|T]):-write_action(H),write_action_list(T).

write_action(action1):-write('Fill 5l bottle'),nl.
write_action(action2):-write('Fill 3l bottle from 5l bottle'),nl.
write_action(action3):-write('Now you have 2l in 5l bottle'),nl.
write_action(action4):-write('Fill those 2l to 3l bottle'),nl.
write_action(action5):-write('Fill 5l bottle again'),nl.
write_action(action6):-write('Fill 3l bottle from 5l bottle.Now you have 4ls in 5l bottle'),nl.

go:-intial_state(Start),goal_state(Goal),can_fill(Start,Goal,List),write_action_list(List),!.
