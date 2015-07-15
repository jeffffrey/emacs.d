
(add-to-list 'load-path "~/.emacs.d/packages/" )

(require 'init-package)

; you know, the look and feel always come first
(require 'init-color)

; general emacs init settings
(require 'init-general)

; editing settings
(require 'init-edit)

; general key bindings. Language specific bindings are not included
(require 'init-hotkey)

(require 'init-javascript)

(require 'init-cpp)


(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e587bd7ea49915da4556c1f5b535e920cb3f65f033ae636ba8ed0d2ca2a14df4" "da1b9f5fe1460e4eef819a08ea6cb32479cda17daffd482b7fd037575348e31d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
