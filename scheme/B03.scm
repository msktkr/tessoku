(define (Supermarket1)
  (let* [(n (read))
         (m (read-multivalue-to-list n))]
    (let loop1 [(m m)]
      (cond [(null? m) "No"]
            [(loop2 (car m) m) "Yes"]
            [else (loop1 (cdr m))]))))

(define (loop2 x1 m)
  (cond [(null? m) #f]
        [(eqv? x1 (car m)) (loop2 x1 (cdr m))]
        [(tasite-1000? x1 (car m) m) #t]
        (else (loop2 x1 (cdr m)))))

(define (tasite-1000? x1 x2 m)
  (cond [(null? m) #f]
        [(eqv? x2 (car m)) (tasite-1000? x1 x2 (cdr m))]
        [(eqv? 1000 (+ x1 x2 (car m))) #t]
        [else (tasite-1000? x1 x2 (cdr m))]))

(display (Supermarket1))
