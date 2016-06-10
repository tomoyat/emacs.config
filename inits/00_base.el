;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;;オートセーブファイルを作らない
(setq auto-save-default nil)

;; backfileを作らない
(setq make-backup-files nil)

;; もしbackup作るなら
;; Backup fileの場所指定
;(setq make-backup-files t)
;(setq backup-directory-alist
;      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
;            backup-directory-alist))


;; キーの設定
(when (eq system-type 'darwin) ; もし、システムが Mac のとき
  (setq mac-pass-control-to-system t)) ; コントロールキーを Mac ではなく Emacs に渡す

;; commandとoptionのいれかえ
;(setq ns-command-modifier (quote meta))
;(setq ns-alternate-modifier (quote super))

;; Ctrl-Zでundo
(define-key global-map "\C-z" 'undo)

;;stop beep sound
;(setq visible-bell t)
;; 警告音もフラッシュも全て無効(警告音が完全に鳴らなくなるので注意)
(setq ring-bell-function 'ignore)

;; フォントロックモード
;; 拡張子ごとによしなに綺麗にしてくれる
(global-font-lock-mode t)
