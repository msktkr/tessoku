(define (Two-Cards)
  (let* [(n (read))
         (k (read))
         (p (read-multivalue-to-list n))
         (q (read-multivalue-to-list n))]
    (let loop [(p p)]
      (cond [(null? p) "No"]
            [(tasite-k? (car p) q k) "Yes"]
            [else (loop (cdr p))]))))

(define (tasite-k? x q k)
  (cond [(null? q) #f]
        [(eqv? k (+ x (car q))) #t]
        [else (tasite-k? x (cdr q) k)]))

(display (Two-Cards))
