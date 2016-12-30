
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
(setq linum-format "%d ")

(load-theme 'moe-light t)

; 透明にする
(if window-system (progn
            (set-frame-parameter (selected-frame) 'alpha '(0.90))
            ))

;; fontの設定
;; http://qiita.com/melito/items/238bdf72237290bc6e42
;; fontの確認は以下をscratchで実行(C-j)
;; (dolist (x (font-family-list)) (print x))

;; デフォルトを設定
;; (set-face-attribute 'default nil :family "Source Han Code JP" :height 100)
(set-face-attribute 'default nil :family "Ricty Diminished Discord" :height 140)

;; 日本語だけ上書き
;(set-fontset-font t 'japanese-jisx0208 (font-spec :family "Tsukushi B Round Gothic" ))
