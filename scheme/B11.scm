(define (BS2 x vec)
  (let loop [(imin 0)
             (imid (div (- (vector-length vec) 1) 2))
             (imax (- (vector-length vec) 1))]
    (cond [(<= imax imin) (+ imid (if (< (vector-ref vec imid) x) 1 0))]
          [(< (vector-ref vec imid) x) (loop (+ imid 1) (div (+ imid 1 imax) 2) imax)]
          [(<= x (vector-ref vec imid)) (loop imin (div (+ imin imid) 2) imid)])))


(let* [(N (read))
       (vec (make-vector N))]
  (dotimes (i N) (vector-set! vec i (read)))
  (sort! vec <)
  (let1 Q (read)
        (dotimes (Q)
                 (display (BS2 (read) vec))
                 (newline))))
