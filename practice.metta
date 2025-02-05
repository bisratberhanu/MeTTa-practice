 (: List Type)
(: Nil List)
( : cons(-> Number List List )) ;; Number type 

! (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil)))))

( = (find-length Nil ) 0)
(  = (find-length (cons $x $xs))
    (+ 1 (find-length $xs))
)

! (find-length (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil)))))) ;; length 5 


;;;;;;;;;;;;;;;;;;;;;;;;;is-member;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( = (is-member $num Nil) (False))
( = (is-member $num (cons $x $xs))
    (if (== $x $num) 
    (True)
    (is-member $num $xs)
     )
)

! (is-member 6 (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil))))))  ; False


;;;;;;;;;;;;;;;;;;;;;;;;; append ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


( = (append $num Nil) (cons $num Nil))
( = (append $num (cons $x $xs))
    (cons $x (append $num $xs) )
)

! (append 7 (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil))))))   
;;[(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 7 Nil))))))]


;;;;;;;;;;;;;;;;;;;;;; max-value ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( = (max-value Nil) -10000)
( = (max-value (cons $x $xs))
    (if (> $x (max-value $xs))
    $x
    (max-value $xs)
    )
)

! (max-value (cons 1 (cons 2 ( cons 3000 (cons 4 (cons 5 Nil))))))  ;; 3000


;;;;;;;;;;;;;;;;;;;;;;;;;;;;min-value;;;;;;;;;;;;;;;;;;;;;;;;;;;;


( = (min-value Nil) 10000)
( = (min-value (cons $x $xs))
    (if (< $x (min-value $xs))
    $x
    (min-value $xs)
    )
)

! (min-value (cons 1 (cons 2 ( cons 3000 (cons 4 (cons 5 Nil))))))  ;; 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; pop ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( = (pop (cons $x Nil)) Nil)
( = (pop (cons $x (cons $y $ys)))
    (cons $x (pop (cons $y $ys)))
)


! (pop (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;remove-element ;;;;;;;;;;;;;;;;;;;;;;;


( = (remove-element $value Nil) Nil)
( = (remove-element $value (cons $x $xs))
    (if ( == $value $x)
    (remove-element $value $xs)
    (cons $x (remove-element $value $xs))
 
    )
)

! (remove-element 4 (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil)))))) ;; [(cons 1 (cons 2 (cons 3 (cons 5 Nil))))]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; remove-duplicates ;;;;;;;;;;;;;;;;;;;;;;;


(= (contains $num Nil) False)
( = (contains $num (cons $x $xs))
    (if (== $num $x)
    True
    (contains $num $xs)
    )
)

( = (remove-duplicate Nil) Nil)
( = (remove-duplicate (cons $x $xs))
    (if (contains $x $xs)
    (remove-duplicate $xs)
    (cons $x (remove-duplicate $xs))
    )
)

! (remove-duplicate (cons 1 (cons 1 ( cons 3 (cons 5 (cons 5 Nil)))))) ;; [(cons 1 (cons 3 (cons 5 Nil)))]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; map ;;;;;;;;;;;;;;;;;;;;;;;;;;;;


( = (square $x ) (* $x $x))  ; this can be any function

( = (map $f Nil) Nil)
( = (map $f (cons $x $xs))
    (cons ($f $x) (map $f $xs))
)


! (map square (cons 1 (cons 1 ( cons 3 (cons 5 (cons 5 Nil)))))) 

;; [(cons 1 (cons 1 (cons 9 (cons 25 (cons 25 Nil)))))] 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; filter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


( = (greater-than2 $x ) (> $x 2))  ; this can be any function that returns a boolean

( = (filter $f Nil) Nil)
( = (filter $f (cons $x $xs))
    (if ($f $x)
        (cons $x (filter $f $xs))
        (filter $f $xs)
    )
)


! (filter greater-than2 (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil))))))  ;; [(cons 3 (cons 4 (cons 5 Nil)))]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;foldl ;;;;;;;;;;;;;;;;;;;;;;;;;


( = (summ $acc $x) (+ $acc $x))  ;; binary function

( = (foldl $f $acc Nil) $acc)
( = (foldl $f $acc (cons $x $xs))
    (foldl $f ($f $acc $x) $xs)
)


! (foldl summ 0 (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil))))))  ;; [15]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; foldr;;;;;;;;;;;;;;;;;;;;;;;;;;


( = (summ $acc $x) (+ $acc $x))  ;; binary function

( = (foldr $f $acc Nil) $acc)
( = (foldr $f $acc (cons $x $xs))
    ($f $x (foldr $f $acc $xs) )
)

! (foldr summ 0 (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil)))))) ;; [15]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;reverse;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(= (append $num Nil) (cons $num Nil)) 

(= (append $num (cons $x $xs))
   (cons $x (append $num $xs)))


(= (reverse Nil) Nil) 
(= (reverse (cons $x $xs))
   (append $x (reverse $xs)))

! (reverse (cons 1 (cons 2 ( cons 3 (cons 4 (cons 5 Nil)))))) ;; [(cons 5 (cons 4 (cons 3 (cons 2 (cons 1 Nil)))))]






