
;;ツールバー非表示
(tool-bar-mode -1)

;;メニューバー非表示
(menu-bar-mode -1)

;;括弧の対応を表示する
(show-paren-mode t)

;;行間
(setq-default line-spacing 1)

;;起動画面の非表示
(setq inhibit-startup-message t)

;; スクロールバー消す
(set-scroll-bar-mode 'nil)

;;; 同じバッファ名の時 <2> とかではなく、ディレクトリ名で区別
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; メニューバーにファイルパスを表示
(setq frame-title-format
      (format "%%f - Emacs" ))

;;モードラインに時刻を表示する
(display-time)

;; 行番号・桁番号を表示
(line-number-mode 1)
(column-number-mode 1)

;;linum mode
(global-linum-mode t)

;; font
(set-face-attribute
 'default nil
 :family "Monaco"
 :height 80)

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Maru Gothic Pro"))
