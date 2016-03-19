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
;   return:     A singly-linked-list which is the result of the conversion
(define (list->singly-linked-list list)
  (cond ; If end of list, return empty
        ((null? list) list)
        ; Otherwise, the first element of the list is the head node's data, and
        ;; the next node is the head node of the singly-linked list converted
        ;; from the rest of the list.
        (else (make-singly-linked-list (car list)
                                       (list->singly-linked-list (cdr list))))))

; linked-list->list
;   Converts a linked list to a list
;   parameters: linked-list Linked list to be converted to a list
;   return:     A list which is the result of the conversion
(define (linked-list->list linked-list)
  (cond ; If linked-list is a singly-linked list, convert it to a list
        ((singly-linked-list? linked-list)
         (singly-linked-list->list linked-list))
        ; Otherwise, raise an error
        (else (error 'linked-list->list
                     '"Only singly linked lists allowed!"
                     linked-list))))

; singly-linked-list->list
;   Converts a singly-linked list to a list
;   parameters: linked-list Singly-linked list to be converted to a list
;   return:     A list which is the reult of the conversion
(define (singly-linked-list->list linked-list)
  (cond ; If linked-list is null, return linked-list
        ((null? (singly-linked-list-next linked-list))
         (list (singly-linked-list-data linked-list)))
        ; Otherwise, return a list containing only the data of the head node
        ;; merged with a list containing the result of singly-linked-list->list
        ;; called on the next node.
        (else
          (append (list (singly-linked-list-data linked-list))
                  (singly-linked-list->list
                    (singly-linked-list-next linked-list))))))

; remove-from-linked-list
;   Removes node at given index from linked list
;   parameters: node-index  Index of node to be removed
;               linked-list Linked list to remove node from
;   return:     Linked list with node removed
(define (remove-from-linked-list node-index linked-list)
  (cond ((= node-index 0) (singly-linked-list-next linked-list))
        (else (remove-from-linked-list2 node-index 0 linked-list))))

; remove-from-linked-list2
;   Helper function for (remove).
;   parameters: node-index Index of node to be removed
;               i Current index
;               linked-list Linked list to remove node from
;   return:     Linked list with node removed
(define (remove-from-linked-list2 node-index i linked-list)
  (cond ((= node-index i) (singly-linked-list-next linked-list))
        (else (make-singly-linked-list
                (singly-linked-list-data linked-list)
                (remove-from-linked-list2 node-index
                         (add1 i)
                         (singly-linked-list-next linked-list))))))
