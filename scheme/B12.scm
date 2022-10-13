(define (func N x)
  (< (+ (expt x 3) x) N))

(define (eqn N)
  (let loop [(imin 0)
             (imax (sqrt N))]
    (if (<= imax imin)
        imin
        (let* [(imid (/ (+ imin imax) 2))
               (f (func N imid))]
          (cond [f (loop (+ imid 0.0001) imax)]
                [else (loop imin (- imid 0.0001))])))))

(let1 N (read) (display (eqn N)))
