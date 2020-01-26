;;; ~/.doom.d/files/package-clojure.el -*- lexical-binding: t; -*-

(require 'cider)
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
           (flycheck-mode)
           ;; Prevent issue company-mode issue:
           ;; https://github.com/clojure-emacs/cider/issues/2714
           (setq cider-enhanced-cljs-completion-p nil
                 cider-default-cljs-repl 'shadow))

(add-hook* 'clojure-mode-hook
           (require 'flycheck-clj-kondo)
           (setq cider-auto-select-test-report-buffer nil)
           (subword-mode -1)
           (clj-hide-namespace)
           (flycheck-mode))

(define-key clojure-mode-map (kbd "M-:") 'clojure-eval-expression)

(define-clojure-indent
  (render 1)
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

(map! (:localleader
        (:map (clojure-mode-map clojurescript-mode-map)
          (:prefix ("n" . "namespace")
            "h" #'clj-hide-namespace))))

(provide 'package-clojure)
