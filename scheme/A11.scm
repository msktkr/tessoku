(define (BinarySearchn x vec)
  (let loop [(imax (vector-length vec))
             (imin 0)
             (imid (div (vector-length vec) 2))]
    (cond [(eqv? x (vector-ref vec imid)) imid]
          [(not (< imin imid imax)) -2]
          [(> x (vector-ref vec imid)) (loop imax imid (div (+ imax imid) 2))]
          [(< x (vector-ref vec imid)) (loop imid imin (div (+ imin imid) 2))])))

(let* [(N (read))
       (X (read))
       (vec (make-vector N))]
  (dotimes (i N) (vector-set! vec i (read)))
  (display (+ 1 (BinarySearchn X vec))))

