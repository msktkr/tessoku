(define (to-binary)
  (let [(n (read))]
    (let loop [(i 9)]
      (cond [(eqv? i 0) (display (mod (div n (expt 2 i)) 2))]
            [(zero? (div n (expt 2 i))) (display 0) (loop (- i 1))]
            [else (display (mod (div n (expt 2 i)) 2)) (loop (- i 1))]
            ))))
(to-binary)
