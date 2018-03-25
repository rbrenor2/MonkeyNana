(define (domain dom_monkeyNana)

    (:requirements
        :durative-actions
        :equality
        :negative-preconditions
        :numeric-fluents
        :object-fluents
        :typing
    )

    (:types

    )

    (:constants

    )

    (:predicates
        (Box ?x)             ; true iff x is a BOX
        (Monkey ?x)          ; true iff x is a MONKEY
        (Banana ?x)          ; true iff x is a BANANA
        (Position ?x)        ; true iff x is a POSITION
        (Height ?x)          ; true iff x is a HEIGHT
        (Monkey-Banana ?x)   ; true iff the MONKEY has the BANANA
        (Monkey-Box ?x)      ; true iff the MONKEY has the BOX
        (Monkey-Position ?x) ; true iff the MONKEY is in the ?x POSITION
        (Monkey-Height ?x)   ; true iff the MONKEY is in the ?x HEIGHT
        (Box-Position ?x)    ; true iff the BOX is in the ?x POSITION
        (Banana-Position ?x) ; true iff the BANANA is in the ?x POSITION
        (Banana-Height ?x)   ; true iff the BANANA is in the ?x HEIGHT
    )

    (:functions

    )

    (:action move                                                          
        :parameters (?x ?y) ; MONKEY moves from ?X to ?Y
        :precondition (and (Position ?x) (Position ?y) (Monkey-Position ?x)) ; ?X and ?Y are POSITIONS and MONKEY is at ?X
        :effect (and (Monkey-Position ?y) (not (Monkey-Position ?x))) ; MONKEY is at ?Y and not at ?X
    )

    (:action catch-Box-atPosition
        :parameters (?x ?y) ; MONKEY catches BOX at ?Y POSITION
        :precondition (and (Box ?x) (Box-Position ?y) (Monkey-Position ?y) (not (Monkey-Box ?x))) ; MONKEY and BOX are at the same ?Y POSITION, and MONKEY still doesn't have the BOX yet
        :effect (Monkey-Box ?x) ; MONKEY has the BOX
    )

    (:action catch-Banana-atPosition
        :parameters (?x ?y) ; MONKEY catches BANANA at ?Y POSITION
        :precondition (and (Banana ?x) (Position ?y) (Monkey-Position ?y) (Banana-Position ?y))  ; ?X is a BANANA, ?Y is a POSITION, MONKEY and BANANA are at ?Y POSITION
        :effect (Monkey-Banana ?x) ; MONKEY has the BANANA
    )

    (:action step-upDown-box-atPosition 
        :parameters (?x ?y ?z) ; MONKEY steps ?X (UP/DOWN) on the BOX ?Y at the ?Z POSITION
        :precondition (and (Height ?x) (Box ?x) (Position ?z) (Monkey-Position ?z) (Box-Position ?z) (not (Monkey-Height ?x))) ; MONKEY and BOX are at the same Z? POSITION and MONKEY is NOT in X? HEIGHT
        :effect (and (Monkey-Height ?x)) ; MONKEY goes to X? HEIGHT
    )
)