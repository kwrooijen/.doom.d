;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Mono" :size 10))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)

(setq neo-window-width 8)
;; (setq magit-display-buffer-function #'magit-display-buffer-traditional)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;; (straight-use-package 'lispy)
;; (straight-use-package 'lispyville)
(straight-use-package 'key-chord)
(key-chord-define-global "xs" 'evil-normal-state-and-save)
(key-chord-mode 1)

(straight-use-package 'simpleclip)
(simpleclip-mode 1)
(straight-use-package 'highlight-parentheses)
(straight-use-package 'cider)
;; (straight-use-package 'flycheck-joker)

(add-to-list 'load-path "~/.doom.d")
(require 'evil)
(require 'functions)
(require 'keys)
(require 'package-lispy)
;; (require 'package-clojure)

(straight-use-package
 '(mc :type git :host github :repo "kwrooijen/mc"))

(multiple-cursors-mode t)

(bind-key* (kbd "M-J") 'mc/mark-next-like-this)
(bind-key* (kbd "M-K") 'mc/mark-previous-like-this)

;; This is originally set to "jk", but causes the "j" key to be inserted during
;; `lispy-move-down`
(setq evil-escape-key-sequence nil)

(winum-mode 1)

;; Fix MC
(shell-command " cp $HOME/.emacs.d/.local/straight/build/mc/* $HOME/.emacs.d/.local/straight/build/multiple-cursors/*")
(setq doom-localleader-key "SPC j")
