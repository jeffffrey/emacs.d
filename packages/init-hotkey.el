


(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'other-window)
(global-set-key [f3] 'comment-region)
(global-set-key [f8] 'goto-line)

                                        ; c/c++ specifc
(global-set-key [f9] 'gud-break)
(global-set-key [f5] 'ecb-activate)
(global-set-key [f6] 'ecb-deactivate)

(global-set-key [(control t)] 'copy-line-or-region) ; copy.
(global-set-key [(control g)] 'cut-line-or-region)  ; cut

(global-set-key [(control o)] 'find-file)              ; use Ctrl-o to open a (new) file
(global-set-key [(control s)] 'save-buffer)            ; save with Ctrl-s
(global-set-key [(meta s)]    'write-file)             ; 'save file as...' with Meta-s
(global-set-key [(control r)] 'replace-string)         ; search and replace with Ctrl-r




(provide 'init-hotkey)
