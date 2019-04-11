initial_state(state(door,onfloor,window,hasnot)).
goal_state(state(middle,onbox,middle,has)).

do( state(middle, onbox, middle, hasnot),   % grab banana
    grab,
    state(middle, onbox, middle, has)). 

do( state(middle, onfloor, middle, Banana),           % climb box
    climb,
    state(middle, onbox, middle, Banana)).

do( state(L1, onfloor, L1, Banana),         % push box from L1 to L2
    push(L1, L2),  
    state(L2, onfloor, L2, Banana)).

do( state(L1, onfloor, Box, Banana),        % walk from L1 to L2
    walk(L1, L2),
    state(L2, onfloor, Box, Banana) ).

       
path(Goal,Goal,[]).

path(Start,Goal,[H|T]):-do(Start,H,Next_state),
path(Next_state,Goal,T).

write_list([]).
write_list([H|T]):-write_action(H),write_list(T).

write_action(grab):-write('monkey grab the banana'),nl.
write_action(climb):-write('monkey climb the box'),nl.
write_action(push(L1,L2)):-write('monkey push the box from '),write(L1),write(' to '),write(L2),nl.
write_action(walk(L1,L2)):-write('monkey walk from '),write(L1),write(' to '),write(L2),nl.

go:-initial_state(Start),goal_state(Goal),path(Start,Goal,List),write_list(List),!.
       
