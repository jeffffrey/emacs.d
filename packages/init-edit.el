

;; Make Shift|Control|Control+Shift-movement|Home|End keys work on the GNU/Linux console or in an xterm

(when (or (string= (getenv "TERM") "linux")
          (string= (getenv "TERM") "xterm"))
  (define-key function-key-map "\eO2A" [S-up])
  (define-key function-key-map "\eO2B" [S-down])
  (define-key function-key-map "\eO2C" [S-right])
  (define-key function-key-map "\eO2D" [S-left])
  (define-key function-key-map "\eO5C" [C-right])
  (define-key function-key-map "\eO5D" [C-left])
  (define-key function-key-map "\eO6C" [C-S-right])
  (define-key function-key-map "\eO6D" [C-S-left])
  (define-key function-key-map "\eO2H" [S-home])
  (define-key function-key-map "\eO2F" [S-end])
  (define-key function-key-map "\eO5H" [C-home])
  (define-key function-key-map "\eO5F" [C-end])
  (define-key function-key-map "\eO6H" [C-S-home])
  (define-key function-key-map "\eO6F" [C-S-end])
)



;; ; search forward with Ctrl-f
(global-set-key [(control f)] 'isearch-forward)
(define-key isearch-mode-map [(control f)] (lookup-key isearch-mode-map "\C-s"))
(define-key minibuffer-local-isearch-map [(control f)]
  (lookup-key minibuffer-local-isearch-map "\C-s"))

;; ; search backward with Alt-f
(global-set-key [(meta f)] 'isearch-backward)
(define-key isearch-mode-map [(meta f)] (lookup-key isearch-mode-map "\C-r"))
(define-key minibuffer-local-isearch-map [(meta f)]
    (lookup-key minibuffer-local-isearch-map "\C-r"))



(global-set-key [(meta i)] 'forward-page)
(global-set-key [(meta u)] 'backward-page)
(global-set-key [(meta k)] 'kill-word)


;; Interactive Do Things
(require 'ido)
(ido-mode t) ; for buffers and files
(setq
 ido-ignore-buffers ;; ignore these guys
 '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido")
 ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~/JCloud/workspace/")
 ido-everywhere t                 ; use for many file dialogs
 ido-case-fold  t                 ; be case-insensitive
 ido-enable-last-directory-history t ; remember last used dirs
 ido-max-work-directory-list 30   ; should be enough
 ido-max-work-file-list      50   ; remember many
 ido-use-filename-at-point nil    ; don't use filename at point (annoying)
 ido-use-url-at-point nil         ;  don't use url at point (annoying)
 ido-enable-flex-matching t       ; be flexible
 ido-max-prospects 4              ; don't spam my minibuffer
 ido-confirm-unique-completion t) ; wait for RET, even with unique completion


;; ;; enable CUA mode ( for Ctrl-V, Ctrl-C, etc.)
(cua-mode t)
(global-set-key [f4]   'cua-set-rectangle-mark)
;; there's a bug since emacs 23.2 that it binds S-up to select key
;; these two lines solve that problem
                                        ;(if (equal "xterm" (tty-type))
                                        ;    (define-key input-decode-map "\e[1;2A" [S-up]))
                                        ; (defadvice terminal-init-xterm (after select-shift-up activate)
                                        ;   (define-key input-decode-map "\e[1;2A" [S-up]))

                                        ; (cond ( (string= (getenv "TERM") "xterm-vt220")
                                        ;         (global-set-key "\M-[1;5P" [C-f1])
                                        ;         (global-set-key "\M-[1;5Q" [C-f2])
                                        ;         (global-set-key "\M-[1;5R" [C-f3])
                                        ;         (global-set-key "\M-[1;5S" [C-f4])
                                        ;         (global-set-key [select]   [end])  ))


;; Standard Windows behaviour
(setq cua-keep-region-after-copy t)


(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (next-line)
      (transpose-lines 1))
    (next-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (next-line)
      (transpose-lines -1))
    (move-to-column col)))

(defun duplicate-line()
(interactive)
(move-beginning-of-line 1)
(kill-line)
(yank)
(newline)
(yank))

(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "S-C-<down>") 'duplicate-line)
;;(global-set-key (kbd "M-m") 'comment-region)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)
(setq show-paren-style 'parentheses)

;; ;;Use "%" to jump to the matching parenthesis.
(defun goto-match-paren (arg)
 "Go to the matching parenthesis if on parenthesis, otherwise insert
the character typed."
 (interactive "p")
 (cond ((looking-at "\s(") (forward-list 1) (backward-char 1))
 ((looking-at "\s)") (forward-char 1) (backward-list 1))
 (t                    (self-insert-command (or arg 1))) ))
(global-set-key "%" `goto-match-paren)


(defun backward-open-bracket ()
  "Move cursor to the previous occurrence of left bracket or quotation mark.."
  (interactive)
  (search-backward-regexp (regexp-opt '("\""  "{" "[" "<" "〔" "【" "〖" "〈" "《" "「"\
"『" "“" "‘" "‹" "«")) nil t))
(search-backward-regexp (regexp-opt '("{")) nil t)


(defun forward-close-bracket ()
  "Move cursor to the next occurrence of right bracket or quotation mark."
  (interactive)
   (search-forward-regexp (regexp-opt '("\"" ")" "\\]" "}" ">" "〕" "】" "〗" "〉" "》"\
"」" "』" "”" "’" "›" "»")) nil t)
   (search-forward-regexp (regexp-opt '( "}" )) nil t))

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(global-set-key (kbd "<M-left>") 'backward-open-bracket) ; Alt+←
(global-set-key (kbd "<M-right>") 'forward-close-bracket) ; Alt+→
(global-set-key "%" 'match-paren)


(provide 'init-edit)
