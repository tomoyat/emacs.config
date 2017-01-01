(setq
 inhibit-startup-screen t ;;start up screenをださない
 auto-save-default nil ;;オートセーブファイルを作らない
 create-lockfiles nil ;;#で始まるlockfileを作らない
 make-backup-files nil ;;backupを作らない
 scroll-error-top-bottom t ;;スクロールした時に最後や最初まで移動できる
 ring-bell-function 'ignore ;; 警告音もフラッシュも全て無効(警告音が完全に鳴らなくなるので注意)
 require-final-newline t) ;;行末に自動的に改行を入れる

;; キーの設定
(when (eq system-type 'darwin) ; もし、システムが Mac のとき
  (setq mac-pass-control-to-system t)) ; コントロールキーを Mac ではなく Emacs に渡す

(define-key global-map "\C-z" 'undo)
(define-key global-map "\C-h" 'delete-backward-char)

;; 表示設定
(show-paren-mode t) ;; かっこの対応を表示
(setq
 show-paren-delay 0.2 ;; かっこの対応付けを出すまでの遅延
 column-number-mode t ;; モードラインに行番号表示
 line-number-mode t) ;; モードラインに列番号表示

(tool-bar-mode -1) ;;ツールバー非表示
(menu-bar-mode -1) ;;メニューバー非表示
(display-time) ;;モードラインに時刻を表示する
(set-scroll-bar-mode 'nil);; スクロールバー消す

;;; 同じバッファ名の時 <2> とかではなく、ディレクトリ名で区別
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; メニューバーにファイルパスを表示
(setq frame-title-format
      (format "%%f - Emacs" ))

;;linum mode
(global-linum-mode t)
(setq linum-format "%d ")

;; デフォルトを設定
(set-face-attribute 'default nil :family "Ricty Diminished Discord" :height 140)

;; exec-path-from-shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
