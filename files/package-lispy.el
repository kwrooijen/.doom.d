;;; ~/.doom.d/files/package-lispy.el -*- lexical-binding: t; -*-

(require 'lispyville)
(require 'lispy)
(require 'functions)

(defface paren-face
  '((((class color) (background dark))
     (:foreground "grey20"))
    (((class color) (background light))
     (:foreground "grey80")))
  "Face used to dim parentheses.")

(add-hook* 'lispy-mode-hook
           (turn-off-smartparens-mode)
           (rainbow-delimiters-mode-disable)
           (global-highlight-parentheses-mode -1)
           (font-lock-add-keywords nil '((")" . 'paren-face)))
           (font-lock-add-keywords nil '(("}" . 'paren-face)))
           (font-lock-add-keywords nil '(("]" . 'paren-face))))

(evil-define-key 'insert lispy-mode-map
  "[" #'lispy-brackets-or-barf)

(evil-define-key 'insert lispy-mode-map
  "]" #'lispy-slurp)

(evil-define-key 'insert lispy-mode-map
  (kbd "M-[") #'lispy-wrap-brackets-or-reverse-barf)

(defun lispy--mode-p ()
  (or (lispy-left-p)
      (lispy-right-p)))

(defun lispy-left-insert ()
  (interactive)
  (when (not (lispy--mode-p))
    (lispy-left 1))
  (when (not (lispy--mode-p))
    (beginning-of-defun))
  (evil-insert-state 1))

(defun lispy-beginning-of-defun-insert ()
  (interactive)
  (end-of-line)
  (beginning-of-defun)
  (evil-insert-state 1))

(defun lispy-global-teleport (arg)
  (interactive "p")
  (let ((lispy-teleport-global t))
    (lispy-teleport arg)))

(defun lispy-brackets-or-barf (arg)
  (interactive "P")
  (if (lispy--mode-p)
      (lispy-barf 1)
    (lispy-brackets arg)))

(defun lispy-wrap-brackets-or-reverse-barf ()
  (interactive)
  (if (lispy--mode-p)
      (save-excursion
        (lispy-different)
        (lispy-barf 1))
    (lispy-wrap-brackets)))

(defun lispy-reverse-slurp ()
  (interactive)
  (save-excursion
    (lispy-different)
    (lispy-slurp 1)))

(defun lispy-minibuffer-eval (arg)
  (interactive "P")
  (pcase major-mode
    ('emacs-lisp-mode (lispy-eval arg))
    ('clojure-mode (cider-eval-sexp-at-point arg))))

(defun lispy-global-ace-paren ()
  (interactive)
  (lispy-ace-paren t)
  (evil-insert-state 1))

(defun lispy-o ()
  (interactive)
  (when (lispy-left-p)
    (lispy-different))
  (lispy-newline-and-indent-plain))

(defun lispy-maybe-delete ()
  (interactive)
  (when (lispy--mode-p)
    (lispy-delete 1)))

(eval-after-load "lispy"
  `(progn
     (lispyville--define-key 'normal
       (kbd "M-a") #'lispy-left-insert)
     (lispyville--define-key 'insert
       (kbd "M-a") #'lispy-left-insert)

     (lispyville--define-key 'normal (kbd "M-J") #'mc/mark-next-like-this)
     (lispyville--define-key 'normal (kbd "M-J") #'mc/mark-next-like-this)

     (define-key lispyville-mode-map (kbd "M-w") 'lispyville-yank)
     (define-key lispy-mode-map (kbd "s-a") 'lispy-left-insert)
     (define-key lispyville-mode-map (kbd "s-a") 'lispy-left-insert)
     (define-key lispy-mode-map (kbd "M-A") 'lispy-beginning-of-defun-insert)
     (define-key lispy-mode-map (kbd "C-S") 'lispy-unstringify)
     (define-key lispy-mode-map (kbd "M-i") 'tab-to-tab-stop)
     (define-key lispy-mode-map (kbd "M-q") 'lispy-global-ace-paren)
     (lispy-define-key lispy-mode-map "M-]" 'lispy-reverse-slurp)
     (lispy-define-key lispy-mode-map "o" 'lispy-o)
     (lispy-define-key lispy-mode-map "j" 'lispy-down)
     (lispy-define-key lispy-mode-map "e" 'lispy-minibuffer-eval)
     (lispy-define-key lispy-mode-map "x" 'lispy-maybe-delete)
     (lispy-define-key lispy-mode-map "]" 'lispy-slurp)
     (lispy-define-key lispy-mode-map "A" 'lispy-ace-symbol-replace)
     (lispy-define-key lispy-mode-map "H" 'special-lispy-move-left)
     (lispy-define-key lispy-mode-map "J" 'special-lispy-down-slurp)
     (lispy-define-key lispy-mode-map "K" 'special-lispy-up-slurp)
     (lispy-define-key lispy-mode-map "L" 'special-lispy-move-right)
     (lispy-define-key lispy-mode-map "I" 'evil-insert-state)
     (lispy-define-key lispy-mode-map "T" 'lispy-global-teleport)))

(defadvice lispy-bind-variable (after lispy-bind-variable activate)
  (evil-insert-state 1))

(defadvice special-lispy-delete (after special-lispy-delete activate)
  (lispy-left-insert))

(provide 'package-lispy)
