(define (domain dom_monkeyNana)

    (:requirements :strips :typing)

    (:types BOX MONKEY BANANA POSITION HEIGHT)

    (:predicates
        ;(Box ?x)             ; true iff x is a BOX
        ;(Monkey ?x)          ; true iff x is a MONKEY
        ;(Banana ?x)          ; true iff x is a BANANA
        ;(Position ?x)        ; true iff x is a POSITION
        ;(Height ?x)          ; true iff x is a HEIGHT
        (MonkeyHasBanana ?banana)    ; true iff the MONKEY has the BANANA
        (MonkeyHasBox ?box)          ; true iff the MONKEY has the BOX
        (MonkeyAtPosition ?position) ; true iff the MONKEY is in the ?x POSITION
        (MonkeyAtHeight ?height)     ; true iff the MONKEY is in the ?x HEIGHT
        (BoxAtPosition ?position)    ; true iff the BOX is in the ?x POSITION
        (BananaAtPosition ?position) ; true iff the BANANA is in the ?x POSITION
        (BananaAtHeight ?height)     ; true iff the BANANA is in the ?x HEIGHT
    )

    (:action move                                                          
        :parameters (?position1 - POSITION
                     ?position2 - POSITION) ; MONKEY moves from ?position1 to ?position2
        :precondition (and (MonkeyAtPosition ?position1)) ; ?position1 and ?position2 are POSITIONS and MONKEY is at ?position1
        :effect (and (MonkeyAtPosition ?position2) (not (MonkeyAtPosition ?position1))) ; MONKEY is at ?Y and not at ?X
    )

    (:action catchBoxAtPosition
        :parameters (?position - POSITION
                     ?box      - BOX) ; MONKEY catches BOX at ?Y POSITION
        :precondition (and (BoxAtPosition ?position) (MonkeyAtPosition ?position) (not (MonkeyHasBox ?box))) ; MONKEY and BOX are at the same ?Y POSITION, and MONKEY still doesn't have the BOX yet
        :effect (MonkeyHasBox ?box)   ; MONKEY has the BOX
    )

    (:action catchBananaAtPosition
        :parameters (?banana   - BANANA
                     ?position - POSITION
                     ?height   - HEIGHT ) ; MONKEY catches BANANA at ?Y POSITION
        :precondition (and (MonkeyAtPosition ?position) (BananaAtPosition ?position) (MonkeyAtHeight ?height) (BananaAtHeight ?height))  ; ?X is a BANANA, ?Y is a POSITION, MONKEY and BANANA are at ?Y POSITION
        :effect (MonkeyHasBanana ?banana) ; MONKEY has the BANANA
    )

    (:action stepUpBoxAtPosition 
        :parameters (?height1  - HEIGHT
                     ?height2  - HEIGHT 
                     ?box      - BOX
                     ?position - POSITION
                     ?banana   - BANANA) ; MONKEY steps ?X (UP/DOWN) on the BOX ?Y at the ?Z POSITION
        :precondition (and (MonkeyAtPosition ?position) (BoxAtPosition ?position) (MonkeyHasBox ?box)  (MonkeyAtHeight ?height1) (not (MonkeyHasBanana ?banana))) ; MONKEY and BOX are at the same Z? POSITION and MONKEY is NOT in X? HEIGHT
        :effect  (and (MonkeyAtHeight ?height2)) ; MONKEY goes to X? HEIGHT
    )
    
    (:action stepDownBoxAtPosition 
        :parameters (?height1  - HEIGHT
                     ?height2  - HEIGHT 
                     ?box      - BOX
                     ?position - POSITION
                     ?banana   - BANANA) ; MONKEY steps ?X (UP/DOWN) on the BOX ?Y at the ?Z POSITION
        :precondition (and (MonkeyAtPosition ?position) (BananaAtHeight ?height1) (BoxAtPosition ?position) (MonkeyHasBox ?box) (MonkeyAtHeight ?height1) (MonkeyHasBanana ?banana)) ; MONKEY and BOX are at the same Z? POSITION and MONKEY is NOT in X? HEIGHT
        :effect (and (MonkeyAtHeight ?height2) (BananaAtHeight ?height2)) ; MONKEY goes to X? HEIGHT
    )
    
)