//This is an implementaion of the language described in "Logic in Computer Science - Modelling and Reasoning about Systems" book, section 2.7.2 

//Signatures

sig Person {}

one sig SoapOpera {
    cast : set Person,
    alma : one cast,
    loves : cast set -> set cast,
}

//Facts

fact NoSelfLove {
    all c : SoapOpera.cast | not c in c.(SoapOpera.loves)
}

//Assertions

assert OfLovers {
    all x, y : SoapOpera.cast | ((SoapOpera.alma in x.(SoapOpera.loves)) and (x in y.(SoapOpera.loves))) implies not (SoapOpera.alma in y.(SoapOpera.loves))
}

//Check

check OfLovers for 2
