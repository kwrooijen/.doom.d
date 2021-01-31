;;; files/kwrooijen-clojure.el -*- lexical-binding: t; -*-
;;;

(use-package! cider
  :config
  (map! (:localleader
         (:map (clojure-mode-map clojurescript-mode-map)
          "hp" 'hiccup-cli--paste-as-hiccup
          "hr" 'hiccup-cli--region-as-hiccup
          "hy" 'hiccup-cli--yank-as-hiccup
          "rec"  #'cljr-extract-constant
          "red"  #'cljr-extract-def
          "ref"  #'cljr-extract-function
          "rad"  #'cljr-add-declaration
          "rai"  #'cljr-add-import-to-ns
          "ram"  #'cljr-add-missing-libspec
          "rap"  #'cljr-add-project-dependency
          "rar"  #'cljr-add-require-to-ns
          "ras"  #'cljr-add-stubs
          "rau"  #'cljr-add-use-to-ns))))

(defgroup hiccup-cli nil
  "Hiccup-cli group."
  :prefix "hiccup-cli-"
  :group 'tools)

(defcustom hiccup-cli--custom-path-to-bin
  (or (executable-find "hiccup-cli")
      "hiccup-cli")
  "Custom path to the hiccup-cli executable."
  :type 'file
  :group 'hiccup-cli)

(defcustom hiccup-cli--custom-path-to-tmp-file
  "/tmp/hiccup-cli"
  "Custom path to the hiccup-cli tmp file."
  :type 'file
  :group 'hiccup-cli)

(defun hiccup-cli--clipboard-string ()
  "Return the currency value of the clipboard as a string."
  (let ((clipboard-text (gui--selection-value-internal 'CLIPBOARD))
	(select-enable-clipboard t))
    (if (and clipboard-text (> (length clipboard-text) 0))
	(kill-new clipboard-text))
    (car kill-ring)))

(defun hiccup-cli--write-to-tmp-file (string)
  "Write STRING to `hiccup-cli--custom-path-to-tmp-file`."
  (write-region string nil hiccup-cli--custom-path-to-tmp-file))

(defun hiccup-cli--insert ()
  "Insert converted Hiccup from `hiccup-cli--custom-path-to-tmp-file` into buffer."
  (save-excursion
    (insert
     (shell-command-to-string
      (format "%s --html-file %s"
              hiccup-cli--custom-path-to-bin
              hiccup-cli--custom-path-to-tmp-file)))))

;;;###autoload
(defun hiccup-cli--paste-as-hiccup ()
  "Paste the HTML in your clipboard as Hiccup syntax."
  (interactive)
  (hiccup-cli--write-to-tmp-file (hiccup-cli--clipboard-string))
  (hiccup-cli--insert))

;;;###autoload
(defun hiccup-cli--region-as-hiccup (start end)
  "Replace the HTML in your selected START END region with Hiccup syntax."
  (interactive "r")
  (if (use-region-p)
      (let ((region-str (buffer-substring start end)))
        (kill-region start end)
        (hiccup-cli--write-to-tmp-file region-str)
        (hiccup-cli--insert))))

;;;###autoload
(defun hiccup-cli--yank-as-hiccup ()
  "Paste the HTML in your `kill-ring` as Hiccup syntax."
  (interactive)
  (hiccup-cli--write-to-tmp-file (substring-no-properties (car kill-ring)))
  (hiccup-cli--insert))

(provide 'kwrooijen-clojure)
