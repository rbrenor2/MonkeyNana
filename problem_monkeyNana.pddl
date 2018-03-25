;--------   SCRIPT    ----------
;MONKEY MOVES from posA to posB
;MONKEY CATCHES the BOX
;MONKEY MOVES from posB to posC
;MONKEY STEPS UP the BOX
;MONKEY CATCHES the BANANA
;MONKEY STEPS DOWN the BOX
;MONKEY MOVES from posC to posB
;MONKEY MOVES from posB to posA

(define (problem p)
        (:domain dom_monkeyNana)

    (:objects monkey - MONKEY
              box    - BOX
              banana - BANANA
              posA   - POSITION
              posB   - POSITION
              posC   - POSITION
              low    - HEIGHT
              high   - HEIGHT)

    (:init 
        ;(Monkey monkey) 
        ;(Position posA)
        ;(Position posB)
        ;(Position posC)
        ;(Box box)
        ;(Banana banana)
        (MonkeyAtPosition posA) ; MONKEY starts at POSITION posA
        (MonkeyAtHeight low)    ; MONKEY starts at HEIGHT low
        (BoxAtPosition posB)    ; BOX starts at POSITION posB
        (BananaAtPosition posC) ; BANANA starts at POSITION posC
        (BananaAtHeight high)   ; BANANA starts at HEIGHT high
    )

    (:goal
        (and (MonkeyHasBanana banana) ; MONKEY ends up with the BANANA
        (MonkeyAtHeight low)          ; MONKEY ends up with HEIGHT = LOW
        (MonkeyAtPosition posA)       ; MONKEY ends up at POSITION = posA
        (BananaAtHeight low)          ; BANANA ends up with HEIGHT = LOW
        (BananaAtPosition posA))      ; BANANA ends up at POSITION = posA
    )
)






