;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;;オートセーブファイルを作らない
(setq auto-save-default nil)

;; Backup fileの場所指定
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))

;;stop beep sound
(setq visible-bell t)

;;フォントロックモード
(global-font-lock-mode t)

;; キーの設定
(when (eq system-type 'darwin) ; もし、システムが Mac のとき
  (setq mac-pass-control-to-system t)) ; コントロールキーを Mac ではなく Emacs に渡す

; commandとoptionのいれかえ
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; Ctrl-Z
(define-key global-map "\C-z" 'undo)

