(define (mai k x l)
  (let1 c 0
        (vector-for-each (lambda (n) (set! c (+ c (div x n)))) l)
        (if (< c k) #t #f)))

(define (BS k l)
  (let loop [(imin 0)
             (imid (div 1000000000 2))
             (imax (- 1000000000 1))]
    (let1 f (mai k imid l)
          (cond [(<= imax imin) (+ imid (if f 1 0))]
                [f (loop (+ imid 1) (div (+ imid 1 imax) 2) imax)]
                [else (loop imin (div (+ imin imid) 2) imid)]))))

(let* [(N (read))
       (K (read))
       (l (make-vector N))]
  (dotimes (i N) (vector-set! l i (read)))
  (display (BS K l)))
