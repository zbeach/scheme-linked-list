; linked-list

(require-extension define-structure)

; singly-linked-list
;   A singly-linked list
;   fields: data Data field for the head node
;           next Next node
(define-structure singly-linked-list
  data next)

; list->singly-linked-list
;   Converts a list to a singly-linked list
;   parameters: list List to be converted to a singly-linked list
;   return:     A singly-linked list which is the result of the conversion
(define (list->singly-linked-list list)
  (cond ((null? list) list)
        (else (make-singly-linked-list (car list)
                         (list->singly-linked-list (cdr list))))))

; linked-list->list
;   Converts a linked list to a list
;   parameters: linked-list Linked list to be converted to a list
;   return:     A list which is the reult of the conversion
(define (linked-list->list linked-list)
  (cond ((singly-linked-list? linked-list)
         (singly-linked-list->list linked-list))
        (else (error 'linked-list->list
                     '"Only singly linked lists allowed!"
                     linked-list))))

; singly-linked-list->list
;   Converts a singly-linked list to a list
;   parameters: linked-list Singly-linked list to be converted to a list
;   return:     A list which is the reult of the conversion
(define (singly-linked-list->list linked-list)
  (cond ((null? (singly-linked-list-next linked-list))
         (list (singly-linked-list-data linked-list)))
        (else
          (append (list (singly-linked-list-data linked-list))
                  (singly-linked-list->list
                    (singly-linked-list-next linked-list))))))
