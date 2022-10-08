(use gauche.array)

(define (CountingPoints)
  (let* [(N (read))
         (hen 1501)
         (a1 (make-s32array (shape 0 hen 0 hen) 0))
         (a2 (make-s32array (shape 0 hen 0 hen) 0))
         (vec (make-vector hen 0))]
    (dotimes (N)
             (let [(xy (vector (read) (read)))]
               (array-set! a1 xy (+ (array-ref a1 xy) 1))))
    (let loopv [(i 1)]
      (when (< i hen)
        (let looph [(j 1)]
          (when (< j hen)
            (vector-set! vec j (+ (vector-ref vec (- j 1)) (array-ref a1 (vector i j))))
            (array-set! a2
                        (vector i j)
                        (+ (vector-ref vec j) (array-ref a2 (vector (- i 1) j))))
            (looph (+ j 1))))
        (loopv (+ i 1))))
    (let [(Q (read))]
      (dotimes (Q)
               (let [(hv (read)) (hh (read)) (tv (read)) (th (read))]
                 (display (keisan hv hh tv th a2))
                 (newline))))))

(define (keisan hv hh tv th arr)
  (let [(t (array-ref arr (vector tv th)))
        (h (array-ref arr (vector (- hv 1) th)))
        (v (array-ref arr (vector tv (- hh 1))))
        (k (array-ref arr (vector (- hv 1) (- hh 1))))]
    (- t h (- v k))))

(CountingPoints)
