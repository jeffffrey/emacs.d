
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
