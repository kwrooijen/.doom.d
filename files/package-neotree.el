;;; ~/.doom.d/files/package-neotree.el -*- lexical-binding: t; -*-

(require 'neotree)
(require 'winum)
(require 'bm)

(setq neo-auto-indent-point nil
      neo-dont-be-alone nil
      neo-modern-sidebar nil
      neo-persist-show nil
      neo-show-hidden-files nil
      neo-smart-open nil
      neo-theme 'icons
      neo-force-change-root t)

(add-hook 'neotree-mode-hook
          (lambda ()
            (setq-default cursor-in-non-selected-windows nil)
            (set-window-fringes (get-buffer-window " *NeoTree*") 0 0 nil)

            (defun neo-buffer--insert-banner ())

            (defun neo-buffer--insert-root-entry (node)
              (let* ((path (split-string node "/"))
                     (path (remove-if (lambda (x) (equal "" x)) path))
                     (path (car (last path))))
                (neo-buffer--insert-with-face (or path "NeoTree")
                                              'neo-root-dir-face)
                (neo-buffer--newline-and-begin)))

            (defun neotree-refresh (&optional is-auto-refresh)
              "Refresh the NeoTree buffer."
              (interactive)
              (if (eq (current-buffer) (neo-global--get-buffer))
                  (neo-buffer--refresh t)
                (save-excursion
                  (let ((cw (selected-window)))  ;; save current window
                    (if is-auto-refresh
                        (let ((origin-buffer-file-name (buffer-file-name)))
                          (when (and (fboundp 'projectile-project-p)
                                     (projectile-project-p)
                                     (fboundp 'projectile-project-root))
                            (neo-global--open-dir (projectile-project-root))
                            (neotree-find (projectile-project-root)))
                          (neotree-find origin-buffer-file-name))
                      (neo-buffer--refresh t t))
                    (recenter)
                    (bm-toggle)
                    (internal-show-cursor (get-buffer-window " *NeoTree*") nil)
                    (set-window-fringes (get-buffer-window " *NeoTree*") 0 0 nil)
                    (when (or is-auto-refresh neo-toggle-window-keep-p)
                      (select-window cw))))))))

(defun update-neo-tree-for-template (fun)
  `(defadvice ,fun (after ,fun activate)
     (neotree-refresh t)))


(defmacro update-neo-tree-for (&rest funs)
  (let ((forms (mapcar 'update-neo-tree-for-template funs)))
    `(progn ,@forms)))

(defadvice spacemacs/persp-switch-to-1 (after spacemacs/persp-switch-to-1-after activate)
  (kill-buffer " *NeoTree*")
  (neotree-refresh t))

(defadvice spacemacs/persp-switch-to-2 (after spacemacs/persp-switch-to-2-after activate)
  (kill-buffer " *NeoTree*")
  (neotree-refresh t))

(defadvice spacemacs/persp-switch-to-3 (after spacemacs/persp-switch-to-3-after activate)
  (kill-buffer " *NeoTree*")
  (neotree-refresh t))

(defadvice spacemacs/persp-switch-to-4 (after spacemacs/persp-switch-to-4-after activate)
  (kill-buffer " *NeoTree*")
  (neotree-refresh t))

(defadvice spacemacs/persp-switch-to-5 (after spacemacs/persp-switch-to-5-after activate)
  (kill-buffer " *NeoTree*")
  (neotree-refresh t))

(update-neo-tree-for helm-projectile-find-file
                     helm-projectile-switch-project
                     helm-mini
                     ido-kill-buffer
                     spacemacs/helm-find-files
                     +ivy/projectile-find-file
                     counsel-find-file
                     winner-undo
                     winner-redo
                     dired-find-file
                     winum-select-window-1
                     winum-select-window-2
                     winum-select-window-3
                     winum-select-window-4
                     winum-select-window-5
                     winum-select-window-6
                     winum-select-window-7
                     winum-select-window-8
                     winum-select-window-9)

(defun winum-assign-9-to-calculator-8-to-flycheck-errors ()
  (cond
   ((equal (buffer-name) "*Calculator*") 9)
   ((equal (buffer-name) "*Flycheck errors*") 8)))

(defun winum-assign-0-to-neotree ()
  (when (string-match-p (buffer-name) ".*\\*NeoTree\\*.*") 10))

(add-to-list 'winum-assign-functions #'winum-assign-9-to-calculator-8-to-flycheck-errors)
(add-to-list 'winum-assign-functions #'winum-assign-0-to-neotree)

(set-face-attribute 'bm-face nil :foreground "#fff" :background "Gray20")

(provide 'package-neotree)
