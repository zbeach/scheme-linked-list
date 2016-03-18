(require-extension define-structure)

(define-structure singly-linked-list
  data next)

(define (list->singly-linked-list list)
  (cond ((null? list) list)
        (else (make-singly-linked-list (car list)
                         (list->singly-linked-list (cdr list))))))

(define (linked-list->list linked-list)
  (cond ((singly-linked-list? linked-list)
         (singly-linked-list->list linked-list))
        (else (error 'linked-list->list
                     '"Only singly linked lists allowed!"
                     linked-list))))

(define (singly-linked-list->list linked-list)
  (cond ((null? (singly-linked-list-next linked-list))
         (list (singly-linked-list-data linked-list)))
        (else
          (append (list (singly-linked-list-data linked-list))
                  (singly-linked-list->list
                    (singly-linked-list-next linked-list))))))
