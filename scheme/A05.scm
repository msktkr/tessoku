(define (Three-Cards)
  (let [(n (read))
        (k (read))]
    (let loop [(i 1) (c 0)]
      (cond [(or (< n i) (< (- k 2) i)) c]
            [(< (* n 2) (- k i)) (loop (+ i 1) c)]
            [(< n (- k i)) (loop (+ i 1) (search-top i n k c))]
            [else (loop (+ i 1) (search-btm i n k c))]))))

(define (search-top i n k c)
  (let loop [(j n) (c c)]
    (if (or (zero? j) (< n (- k i j)))
        c
        (loop (- j 1) (+ c 1)))))

(define (search-btm i n k c)
  (let loop [(j 1) (c c)]
    (cond [(or (< n j) (eqv? k (+ i j))) c]
          [(< n (- k i j)) (loop (+ j 1) c)]
          [else (loop (+ j 1) (+ c 1))])))

(display (Three-Cards))
