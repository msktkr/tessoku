(define (rrv n)
  (let [(vec (make-vector (+ n 1) 0))]
    (dotimes (i n) (vector-set! vec (+ i 1) (+ (read) (vector-ref vec i))))
    vec))

(define (HowManyGuests)
  (let* [(N (read))
         (Q (read))
         (guests (rrv N))]
    (dotimes (Q)
             (print (abs (- (vector-ref guests (- (read) 1))
                            (vector-ref guests (read))))))))

(HowManyGuests)
