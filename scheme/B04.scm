(define (bs-to-n)
  (let [(bs (reverse (string->list (read-line))))]
    (let loop [(i 0) (c 0) (bs bs)]
      (cond [(null? bs) c]
            [(char=? #\1 (car bs)) (loop (+ i 1) (+ c (expt 2 i)) (cdr bs))]
            [else (loop (+ i 1) c (cdr bs))]))))
(display (bs-to-n))
