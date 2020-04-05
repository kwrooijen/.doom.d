;;; ~/.doom.d/files/keys.el -*- lexical-binding: t; -*-

;; Unbind all MacOS keys
(define-key key-translation-map (kbd "s-q") (kbd "M-q"))
(define-key key-translation-map (kbd "s-w") (kbd "M-w"))
(define-key key-translation-map (kbd "s-e") (kbd "M-e"))
(define-key key-translation-map (kbd "s-r") (kbd "M-r"))
(define-key key-translation-map (kbd "s-t") (kbd "M-t"))
(define-key key-translation-map (kbd "s-y") (kbd "M-y"))
(define-key key-translation-map (kbd "s-u") (kbd "M-u"))
(define-key key-translation-map (kbd "s-i") (kbd "M-i"))
(define-key key-translation-map (kbd "s-o") (kbd "M-o"))
(define-key key-translation-map (kbd "s-p") (kbd "M-p"))
(define-key key-translation-map (kbd "s-a") (kbd "M-a"))
(define-key key-translation-map (kbd "s-s") (kbd "M-s"))
(define-key key-translation-map (kbd "s-d") (kbd "M-d"))
(define-key key-translation-map (kbd "s-f") (kbd "M-f"))
(define-key key-translation-map (kbd "s-g") (kbd "M-g"))
(define-key key-translation-map (kbd "s-h") (kbd "M-h"))
(define-key key-translation-map (kbd "s-j") (kbd "M-j"))
(define-key key-translation-map (kbd "s-k") (kbd "M-k"))
(define-key key-translation-map (kbd "s-l") (kbd "M-l"))
(define-key key-translation-map (kbd "s-z") (kbd "M-z"))
(define-key key-translation-map (kbd "s-x") (kbd "M-x"))
;; (define-key key-translation-map (kbd "s-c") (kbd "M-c"))
;; (define-key key-translation-map (kbd "s-v") (kbd "M-v"))
(define-key key-translation-map (kbd "s-b") (kbd "M-b"))
(define-key key-translation-map (kbd "s-n") (kbd "M-n"))
(define-key key-translation-map (kbd "s-m") (kbd "M-m"))
(define-key key-translation-map (kbd "s-Q") (kbd "M-Q"))
(define-key key-translation-map (kbd "s-W") (kbd "M-W"))
(define-key key-translation-map (kbd "s-E") (kbd "M-E"))
(define-key key-translation-map (kbd "s-R") (kbd "M-R"))
(define-key key-translation-map (kbd "s-T") (kbd "M-T"))
(define-key key-translation-map (kbd "s-Y") (kbd "M-Y"))
(define-key key-translation-map (kbd "s-U") (kbd "M-U"))
(define-key key-translation-map (kbd "s-I") (kbd "M-I"))
(define-key key-translation-map (kbd "s-O") (kbd "M-O"))
(define-key key-translation-map (kbd "s-P") (kbd "M-P"))
(define-key key-translation-map (kbd "s-A") (kbd "M-A"))
(define-key key-translation-map (kbd "s-S") (kbd "M-S"))
(define-key key-translation-map (kbd "s-D") (kbd "M-D"))
(define-key key-translation-map (kbd "s-F") (kbd "M-F"))
(define-key key-translation-map (kbd "s-G") (kbd "M-G"))
(define-key key-translation-map (kbd "s-H") (kbd "M-H"))
(define-key key-translation-map (kbd "s-J") (kbd "M-J"))
(define-key key-translation-map (kbd "s-K") (kbd "M-K"))
(define-key key-translation-map (kbd "s-L") (kbd "M-L"))
(define-key key-translation-map (kbd "s-Z") (kbd "M-Z"))
(define-key key-translation-map (kbd "s-X") (kbd "M-X"))
(define-key key-translation-map (kbd "s-C") (kbd "M-C"))
(define-key key-translation-map (kbd "s-V") (kbd "M-V"))
(define-key key-translation-map (kbd "s-B") (kbd "M-B"))
(define-key key-translation-map (kbd "s-N") (kbd "M-N"))
(define-key key-translation-map (kbd "s-M") (kbd "M-M"))

(define-key key-translation-map (kbd "s-[") (kbd "M-["))
(define-key key-translation-map (kbd "s-]") (kbd "M-]"))
(define-key key-translation-map (kbd "s-;") (kbd "M-;"))
(define-key key-translation-map (kbd "s-,") (kbd "M-,"))
(define-key key-translation-map (kbd "s-.") (kbd "M-."))
(define-key key-translation-map (kbd "s-`") (kbd "M-`"))
(define-key key-translation-map (kbd "s-!") (kbd "M-!"))
(define-key key-translation-map (kbd "s-@") (kbd "M-@"))
(define-key key-translation-map (kbd "s-#") (kbd "M-#"))
(define-key key-translation-map (kbd "s-$") (kbd "M-$"))
(define-key key-translation-map (kbd "s-%") (kbd "M-%"))
(define-key key-translation-map (kbd "s-^") (kbd "M-^"))
(define-key key-translation-map (kbd "s-&") (kbd "M-&"))
(define-key key-translation-map (kbd "s-*") (kbd "M-*"))
(define-key key-translation-map (kbd "s-_") (kbd "M-_"))
(define-key key-translation-map (kbd "s-+") (kbd "M-+"))
(define-key key-translation-map (kbd "s-=") (kbd "M-="))
(define-key key-translation-map (kbd "s-\\") (kbd "M-\\"))
(define-key key-translation-map (kbd "s-|") (kbd "M-|"))
(define-key key-translation-map (kbd "s-(") (kbd "M-("))
(define-key key-translation-map (kbd "s-)") (kbd "M-)"))
(define-key key-translation-map (kbd "s-1") (kbd "M-1"))
(define-key key-translation-map (kbd "s-2") (kbd "M-2"))
(define-key key-translation-map (kbd "s-3") (kbd "M-3"))
(define-key key-translation-map (kbd "s-4") (kbd "M-4"))
(define-key key-translation-map (kbd "s-5") (kbd "M-5"))
(define-key key-translation-map (kbd "s-6") (kbd "M-6"))
(define-key key-translation-map (kbd "s-7") (kbd "M-7"))
(define-key key-translation-map (kbd "s-8") (kbd "M-8"))
(define-key key-translation-map (kbd "s-9") (kbd "M-9"))
(define-key key-translation-map (kbd "s-&") (kbd "M-&"))

;; Bind Keys
(bind-key* "M-u" 'undo-tree-redo)
(bind-key* "M-+" 'align-regexp)
(bind-key* "M-%" 'anzu-query-replace)
(bind-key* "M-C" 'capitalize-previous-word)

(bind-key* "M-1" 'winum-select-window-1)
(bind-key* "M-2" 'winum-select-window-2)
(bind-key* "M-3" 'winum-select-window-3)
(bind-key* "M-4" 'winum-select-window-4)
(bind-key* "M-5" 'winum-select-window-5)
(bind-key* "M-6" 'winum-select-window-6)
(bind-key* "M-7" 'winum-select-window-7)
(bind-key* "M-8" 'winum-select-window-8)
(bind-key* "M-9" 'winum-select-window-9)

(bind-key* "s-&" 'async-shell-command)

(bind-key* (kbd "M-J") 'mc/mark-next-like-this)
(bind-key* (kbd "M-K") 'mc/mark-previous-like-this)

(evil-define-key 'normal helm-map (kbd "<RET>") 'my/helm-exit-minibuffer)

(key-chord-define-global "xs" 'evil-normal-state-and-save)

(map! (:leader
        (:map (global-mode-map)
          "y" #'helm-show-kill-ring
          "s s" #'helm-swoop)))

(map! :n [tab] 'indent-region
      :i [tab] 'indent-region
      :v [tab] 'indent-region
      :i "C-'" 'yas-expand)

(map! :n (kbd "M-SPC") 'just-one-space
      :i (kbd "M-SPC") 'just-one-space
      :v (kbd "M-SPC") 'just-one-space
      ;; Doesn't work
      :i (kbd "M-SPC") 'just-one-space)

(provide 'keys)
