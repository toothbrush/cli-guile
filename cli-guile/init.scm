
(display "this is the init.scm file")
(newline)

(next-track "billie eilish")

(define queue-panel-map)
(define search-panel-map)

; (define-key queue-panel-map "x" 'delete-track)
; (define-key queue-panel-map "x" 'delete-track)

(define delete-track
  (lambda ()
    (display "defined first!\n")
    (next-track "iron maiden")))


;; in user's config:
(define paul/foo (lambda ()
  (begin
    (delete-track)
    (display "paul's scary thing\n"))))

(define queue-panel-map `(
  ("x" . ,delete-track)
  ("y" . ,paul/foo)
  ))
