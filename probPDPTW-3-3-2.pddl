(define (problem PDPTW-3-3-2)
(:domain PDPTW)
(:objects
 veh1 veh2 - vehicle
 loc1 loc2 loc3 - place
 pkg1 pkg2 pkg3 - package)

(:init 
 ; Vehicle locations
 (objat veh1 loc1)
 (objat veh2 loc1)
 ; Package pickup locations
 (objat pkg1 loc1)
 (objat pkg2 loc2)
 (objat pkg3 loc3)
 ; Package times available for pickup
 (at 10 (available pkg1))
 (at 1 (available pkg2))
 (at 2 (available pkg3))
 ; Package delivery deadlines
 (at 15 (not (available pkg1)))
 (at 10 (not (available pkg2)))
 (at 7 (not (available pkg3)))
)

; Package delivery locations
(:goal (and  (objat pkg1 loc2)
             (objat pkg2 loc3)
             (objat pkg3 loc1)
       )
)
)