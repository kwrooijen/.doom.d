;;; ~/.doom.d/files/functions.el -*- lexical-binding: t; -*-

(defmacro add-hook* (mode &rest body)
  `(add-hook ,mode (lambda () ,@body)))

(defun capitalize-previous-word ()
  (interactive)
  (save-excursion
    (backward-word)
    (capitalize-word 1)))

(defun evil-normal-state-and-save ()
  (interactive)
  (evil-normal-state)
  (save-buffer))

(defun my/helm-exit-minibuffer ()
  (interactive)
  (helm-exit-minibuffer))

(defun change-language ()
  (interactive)
  (save-excursion
    (call-interactively 'ispell-change-dictionary)
    (flyspell-buffer)))

(provide 'functions)
