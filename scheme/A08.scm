(use gauche.array)

(define (TwoDimensionalSum)
  (let* [(H (read))
         (W (read))
         (arr (make-s32array (shape 0 (+ H 1) 0 (+ W 1)) 0))]
    (let loop [(v 1)]
      (when (<= v H)
        (let [(vec (rrv W))]
          (let loop2 [(h 1)]
            (when (<= h W)
              (array-set! arr
                          (vector v h)
                          (+ (array-ref arr (vector (- v 1) h))
                             (vector-ref vec h)))
              (loop2 (+ h 1)))))
        (loop (+ v 1))))
    (let [(Q (read))]
      (dotimes (Q)
               (let [(hv (read)) (hh (read)) (tv (read)) (th (read))]
                 (display (keisan hv hh tv th arr))
                 (newline))))))

(define (keisan hv hh tv th arr)
  (let [(t (array-ref arr (vector tv th)))
        (h (array-ref arr (vector (- hv 1) th)))
        (v (array-ref arr (vector tv (- hh 1))))
        (k (array-ref arr (vector (- hv 1) (- hh 1))))]
    (- t h (- v k))))

(define (rrv n)
  (let [(vec (make-vector (+ n 1) 0))]
    (dotimes (i n) (vector-set! vec (+ i 1) (+ (read) (vector-ref vec i))))
    vec))

(TwoDimensionalSum)
