

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'yasnippet)
(require-package 'auto-complete)
(require 'auto-complete-config)
(maybe-require-package 'ac-js2)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;(maybe-require-package 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))


;; auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")


                                        ; js2-mode settings
(setq js2-highlight-level 3)
(setq-default js2-auto-indent-p nil)
(setq-default js2-enter-indents-newline nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

                                        ; yas setting

(yas-global-mode 1)

(defun yas-ido-expand ()
  "Lets you select (and expand) a yasnippet key"
  (interactive)
  (let ((original-point (point)))
    (while (and
            (not (= (point) (point-min) ))
            (not
             (string-match "[[:space:]\n]" (char-to-string (char-before)))))
      (backward-word 1))
    (let* ((init-word (point))
           (word (buffer-substring init-word original-point))
           (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
                  (lambda (s) (string-match (concat "^" word) s)) list)))
        (if (= (length key) 1)
            (setq key (pop key))
          (setq key (ido-completing-read "key: " list nil nil word)))
        (delete-char (- init-word original-point))
        (insert key)
                        (yas-expand)))))

(global-set-key (kbd "<backtab>")     'yas-ido-expand)


(electric-pair-mode 1)

(provide 'init-javascript)
