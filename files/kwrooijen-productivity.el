;;; files/kwrooijen-productivity.el -*- lexical-binding: t; -*-

(use-package! expand-region
  :bind* (("M-@" . er/expand-region)))

(use-package! winum
  :bind* (("M-1" . winum-select-window-1)
          ("M-2" . winum-select-window-2)
          ("M-3" . winum-select-window-3)
          ("M-4" . winum-select-window-4)
          ("M-5" . winum-select-window-5)
          ("M-6" . winum-select-window-6)
          ("M-7" . winum-select-window-7)
          ("M-8" . winum-select-window-8)
          ("M-9" . winum-select-window-9))
  :config
  (winum-mode))

(use-package! key-chord
  :config
  (add-hook* 'prog-mode-hook (key-chord-mode 1))
  (add-hook* 'isearch-mode-hook (key-chord-mode 1))
  (key-chord-define-global "xs" (lambda ()
                                  (interactive)
                                  (evil-normal-state)
                                  (save-buffer))))

(use-package! multiple-cursors
  :bind* (("M-K" . mc/mark-previous-like-this)
          ("M-J" . mc/mark-next-like-this))
  :init
  (setq mc/list-file "~/.doom.d/.mc-lists.el")
  :config
  (multiple-cursors-mode t))

(use-package! projectile
  :config
  ;; NOTE: Doom rebinds `projectile-generic-command` and breaks .gitignore for
  ;; projectile-find-file
  (setq projectile-generic-command
        (lambda (_)
          (if (executable-find "fd")
              "fd . -0 --type f --color=never"
            "find . -type f -print0"))))

(provide 'kwrooijen-productivity)
