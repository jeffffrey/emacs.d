
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/" )

(load-theme 'monokai t)

                                        ; for ANSI color
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


(defvar font-lock-auto-mode-list
  (list 'c-mode 'c++-mode 'c++-c-mode 'emacs-lisp-mode 'lisp-mode 'perl-mode 'scheme-mode)
     "List of modes to always start in font-lock-mode")

(global-hl-line-mode 1)
(set-face-background hl-line-face "brightblack")
(set-face-underline-p 'highlight nil)

(provide 'init-color)
