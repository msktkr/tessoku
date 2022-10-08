(define (Lottery)
  (let [(N (read))]
    (receive (k m) (read-multivalue-to-vec N)
      (let [(Q (read))
            (keisan (lambda (h t) (- (- (vector-ref k t) (vector-ref k (- h 1)))
                                     (- (vector-ref m t) (vector-ref m (- h 1))))))]
        (dotimes (Q)
                 (let* [(h (read))
                        (t (read))
                        (f (keisan h t))]
                   (cond [(positive? f) (display "win")]
                         [(negative? f) (display "lose")]
                         [else          (display "draw")])
                   (newline)))))))


(define (read-multivalue-to-vec n)
  (let [(k (make-vector (+ n 1) 0))
        (m (make-vector (+ n 1) 0))]
    (dotimes (i n) (if (zero? (read))
                       (begin
                         (vector-set! m (+ i 1) (+ 1 (vector-ref m i)))
                         (vector-set! k (+ i 1) (vector-ref k i)))
                       (begin
                         (vector-set! k (+ i 1) (+ 1 (vector-ref k i)))
                         (vector-set! m (+ i 1) (vector-ref m i)))))
    (values k m)))

(Lottery)
