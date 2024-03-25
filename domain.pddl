;; Simple Pickup and Delivery with Time Windows (PDPTW) Domain
;;

(define (domain PDPTW)
  (:requirements :strips :typing :durative-actions :timed-initial-literals) 
  (:types package
          vehicle - physobj
          place
          physobj - object)
  
  (:predicates
		(objat ?obj - physobj ?loc - place)
		(in ?pkg - package ?veh - vehicle)
    (available ?pkg - package))

 (:durative-action LOAD
  :parameters   (?pkg - package ?vehicle - vehicle ?loc - place)
  :duration (= ?duration 1)
  :condition (and (at start (objat ?pkg ?loc))
                  (over all (and (objat ?vehicle ?loc)
                                 (available ?pkg))))
  :effect (and (at start (not (objat ?pkg ?loc)))
               (at end (in ?pkg ?vehicle))))

 (:durative-action UNLOAD
  :parameters   (?pkg - package ?vehicle - vehicle ?loc - place)
  :duration (= ?duration 1)
  :condition (and (at start (in ?pkg ?vehicle))
                  (over all (and (objat ?vehicle ?loc)
                                 (available ?pkg))))
  :effect (and (at start (not (in ?pkg ?vehicle)))
               (at end (objat ?pkg ?loc))))

 (:durative-action MOVE
  :parameters (?vehicle - vehicle ?loc-from - place ?loc-to - place)
  :duration (= ?duration 2)
  :condition (and (at start (objat ?vehicle ?loc-from)))
  :effect (and (at start (not (objat ?vehicle ?loc-from)))
               (at end (objat ?vehicle ?loc-to))))
)
