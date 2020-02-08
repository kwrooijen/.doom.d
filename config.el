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
(setq display-line-numbers-type 'relative)

(setq neo-window-width 30)

(setq doom-localleader-key "'")

;; (setq magit-display-buffer-function #'magit-display-buffer-traditional)

;; This is originally set to "jk", but causes the "j" key to be inserted during
;; `lispy-move-down`
(setq evil-escape-key-sequence nil)

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
;;
(setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))

(add-to-list 'load-path "~/.doom.d/files/")

(require 'multiple-cursors)
(require 'evil)
(require 'keys)
(require 'functions)
(require 'package-lispy)
(require 'package-clojure)
(require 'package-neotree)

(key-chord-mode 1)
(simpleclip-mode 1)
(multiple-cursors-mode t)
(winum-mode 1)
(evil-snipe-mode -1)

;; Broken https://github.com/hlissner/doom-emacs/issues/2396
(after! neotree
  (advice-remove #'neo-util--set-window-width 'ignore))

;; Fix MC to work with Evil mode
(let* ((build-dir (substitute-in-file-name "$HOME/.emacs.d/.local/straight/build/"))
       (default-directory build-dir))
  (when (not (file-exists-p "multiple-cursors/mc-evil.el"))
    (shell-command " cp mc/* multiple-cursors/*")))

(add-hook 'dired-mode-hook 'auto-revert-mode)
