//This is an implementaion of the language described in "Logic in Computer Science - Modelling and Reasoning about Systems" book, section 2.7.1 

//Signatures

sig State {}

one sig StateMachine {
    states : set State,
    initialState : one states,
    finalStates : set State,
    relations : states set -> set states
}

//Predicates

pred AGuidedSimulation {
    all state : StateMachine.states | (no state.(StateMachine.relations) && (not state in StateMachine.finalStates))
    # StateMachine.states = 3
}

//Assertions

assert FinalNotInitial {
    all M : StateMachine | no (M.initialState & M.finalStates)
}

//Check

check FinalNotInitial for 5

//Run

run AGuidedSimulation for 3