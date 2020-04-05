;;; ~/.doom.d/files/package-clojure.el -*- lexical-binding: t; -*-

(require 'cider)
(straight-use-package 'flycheck-joker)
(require 'flycheck-joker)
(require 'flycheck-clj-kondo)

(require 'clojure-mode)

(setq cider-auto-jump-to-error nil)

(defun clj-hide-namespace ()
  (interactive)
  (when (and (> (buffer-end 1) 5)
             (equal "(ns " (buffer-substring-no-properties 1 5)))
    (save-excursion
      (beginning-of-buffer)
      (hs-hide-block))))

(add-hook* 'clojurescript-mode-hook
           (require 'flycheck-clj-kondo)
           (subword-mode -1)
           (yas-minor-mode)
           (flycheck-mode)
           ;; Prevent issue company-mode issue:
           ;; https://github.com/clojure-emacs/cider/issues/2714
           (setq cider-enhanced-cljs-completion-p nil
                 cider-default-cljs-repl 'shadow))

(add-hook* 'clojure-mode-hook
           (require 'flycheck-clj-kondo)
           (setq cider-auto-select-test-report-buffer nil)
           (subword-mode -1)
           (yas-minor-mode)
           (clj-hide-namespace)
           (flycheck-mode))

(define-key clojure-mode-map (kbd "M-:") 'clojure-eval-expression)
(define-key clojure-mode-map [tab] 'company-complete-common)

(define-clojure-indent
  (render 1)
  (match 1)
  (s/fdef 1)
  (dom/div 1)
  (let-if 1))

(dolist (checker '(clj-kondo-clj clj-kondo-cljs clj-kondo-cljc clj-kondo-edn))
  (setq flycheck-checkers (cons checker (delq checker flycheck-checkers))))

(dolist (checkers '((clj-kondo-clj . clojure-joker)
                    (clj-kondo-cljs . clojurescript-joker)
                    (clj-kondo-cljc . clojure-joker)
                    (clj-kondo-edn . edn-joker)))
  (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers))))

(defun cider-duct-reset ()
  (interactive)
  (cider-interactive-eval "(integrant.repl/reset)"))

(map! (:localleader
        (:map (clojure-mode-map clojurescript-mode-map)
          (:prefix ("r" . "repl")
            "r" #'cider-duct-reset)
          (:prefix ("n" . "namespace")
            "h" #'clj-hide-namespace)
          (:prefix ("f" . "refactor")
            "a" #'cljr-add-declaration
            "a" #'cljr-add-import-to-ns
            "a" #'cljr-add-keybindings-with-modifier
            "a" #'cljr-add-keybindings-with-prefix
            "a" #'cljr-add-missing-libspec
            "a" #'cljr-add-project-dependency
            "a" #'cljr-add-require-to-ns
            "a" #'cljr-add-stubs
            "a" #'cljr-add-use-to-ns
            "a" #'cljr-change-function-signature
            "a" #'cljr-clean-ns
            "a" #'cljr-create-fn-from-example
            "a" #'cljr-cycle-thread
            "a" #'cljr-describe-refactoring
            "a" #'cljr-destructure-keys
            "a" #'cljr-expand-let
            "a" #'cljr-extract-constant
            "a" #'cljr-extract-def
            "a" #'cljr-extract-function
            "a" #'cljr-find-usages
            "a" #'cljr-hotload-dependency
            "a" #'cljr-inline-symbol
            "a" #'cljr-introduce-let
            "a" #'cljr-move-form
            "a" #'cljr-move-to-let
            "a" #'cljr-project-clean
            "a" #'cljr-promote-function
            "a" #'cljr-raise-sexp
            "a" #'cljr-reify-to-defrecord
            "a" #'cljr-remove-let
            "a" #'cljr-rename-file
            "a" #'cljr-rename-file-or-dir
            "a" #'cljr-rename-symbol
            "a" #'cljr-require-macro
            "a" #'cljr-show-changelog
            "a" #'cljr-slash
            "a" #'cljr-sort-project-dependencies
            "a" #'cljr-splice-sexp-killing-backward
            "a" #'cljr-splice-sexp-killing-forward
            "a" #'cljr-stop-referring
            "a" #'cljr-toggle-debug-mode
            "a" #'cljr-update-project-dependencies
            "a" #'cljr-update-project-dependency
            "a" #'cljr-version
            "a" #'clojure-cycle-if
            "a" #'clojure-cycle-privacy
            "a" #'clojure-thread
            "f" #'clojure-thread-first-all
            "F" #'clojure-thread-last-all
            "u" #'clojure-unwind
            "U" #'clojure-unwind-all))))

;; Hack to not select buffer with cider errors
(defun cider-popup-buffer-display (buffer &optional select)
  (let ((window (get-buffer-window buffer 'visible)))
    (when window
      (with-current-buffer buffer
        (set-window-point window (point))))
    (unless (eq window (selected-window))
      (funcall (if nil #'pop-to-buffer #'display-buffer)
               buffer `(nil . ((inhibit-same-window . ,pop-up-windows)
                               (reusable-frames . visible))))))
  buffer)

(provide 'package-clojure)
