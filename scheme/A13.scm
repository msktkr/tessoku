(define (count<k K vec)
  (letrec* [(n (- (vector-length vec) 1))
            (vr (pa$ vector-ref vec))
            (lp1 (lambda (i j c)
                   (cond [(< n j) c]
                         [(eqv? j n) (lp2 i j c)]
                         [(<= (- (vr j) (vr i)) K) (lp1 i (+ j 1) (+ c 1))]
                         [else (lp2 (+ i 1) j c)])))
            (lp2 (lambda (i j c)
                   (if (eqv? i j)
                       (lp1 i (+ i 1) c)
                       (lp2 (+ i 1) j (+ c 1)))))]
    (lp1 0 1 0)))

(let* [(N (read)) (K (read)) (vec (make-vector N))]
  (dotimes (i N) (vector-set! vec i (read)))
  (display (count<k K vec)))

(define (shaku)
  (let* [(N (read)) (K (read)) (vec (make-vector N))]
    (dotimes (i N) (vector-set! vec i (read)))
    (display (count<k K vec))))
