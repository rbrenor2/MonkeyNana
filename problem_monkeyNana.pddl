;-------   SCRIPT    ----------
;MONKEY MOVES from posA to posB
;MONKEY CATCHES the BOX
;MONKEY MOVES from posB to posC
;MONKEY STEPS UP the BOX
;MONKEY CATCHES the BANANA
;MONKEY STEPS DOWN the BOX
;MONKEY MOVES from posC to posB
;MONKEY MOVES from posB to posA

(define (problem p))
        (:domain dom_monkeyNana)
(:objects monkey, box, banana, posA, posB, posC, low, high)

(:init 
    (Monkey monkey) 
    (Position posA)
    (Position posB)
    (Position posC)
    (Box box)
    (Banana banana)
    (Monkey-Position posA) ; MONKEY starts at POSITION posA
    (Monkey-Height low)    ; MONKEY starts at HEIGHT low
    (Box-Position posB)    ; BOX starts at POSITION posB
    (Banana-Position posC) ; BANANA starts at POSITION posC
    (Banana-Height high)   ; BANANA starts at HEIGHT high
)

(:goal
    (Monkey-Banana banana) ; MONKEY ends up with the BANANA
    (Monkey-Height low)    ; MONKEY ends up with HEIGHT = LOW
    (Monkey-Position posA) ; MONKEY ends up at POSITION = posA
    (Banana-Height low)    ; BANANA ends up with HEIGHT = LOW
    (Banana-Position posA) ; BANANA ends up at POSITION = posA
)
