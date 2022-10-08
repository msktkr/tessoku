(define (EventAttendance)
  (let* [(D (read))
         (N (read))
         (rai (make-vector (+ D 1) 0))
         (rui (make-vector (+ D 1) 0))]
    (dotimes (N)
             (let [(h (read))
                   (t (read))]
               (vector-set! rai (- h 1) (+ (vector-ref rai (- h 1)) 1))
               (vector-set! rai t (- (vector-ref rai t) 1))))
    (dotimes (i D)
             (vector-set! rui (+ i 1) (+ (vector-ref rui i) (vector-ref rai i))))
    (let loop [(i 1)]
      (when (<= i D)
        (display (vector-ref rui i))
        (newline)
        (loop (+ i 1))))))

(EventAttendance)
