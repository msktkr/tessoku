(define (Liner-Search)
  (let* [(n (read))
         (x (read))
         (l (read-multivalue-to-vec n))]
    (let loop [(i 0)]
      (cond [(eqv? i n) "No"]
            [(eqv? (ref l i) x) "Yes"]
            [else (loop (+ i 1))]))))

(display (Liner-Search))

