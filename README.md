# scheme-linked-list
Explicit implementation of linked lists in Chicken Scheme

## Converting a list to a singly-linked list
```
> (define MY-LIST '(0 1 2 3 4 5 6 7 8 9))
> (define MY-LINKED-LIST
>   (list->singly-linked-list MY-LIST))
,..
```

## Converting a linked list to a list
```
> (linked-list->list MY-LINKED-LIST)
(0 1 2 3 4 5 6 7 8 9)
```

## Removing a node from a linked list
```
> (define INDEX 5)
> (linked-list->list
    (remove INDEX MY-LINKED-LIST))
(0 1 2 3 4 6 7 8 9)
```
