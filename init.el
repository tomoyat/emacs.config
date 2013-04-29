;;bashrcに記述 -nw の時に256色使えるようにするため
;;alias emacs='TERM=xterm-256color emacs' 
;日本語にする
(set-language-environment 'Japanese)


;ファイル名を大文字小文字区別しない
(setq completion-ignore-case t)

;バッファ自動再読み込み
(global-auto-revert-mode 1)

;同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;tool barを表示しない
(tool-bar-mode -1)

;menu-barを表示しない
(menu-bar-mode -1)

;選択範囲をハイライト
(transient-mark-mode t)

;beep off
(setq visible-bell t)

;起動画面を表示しない
(setq inhibit-startup-message t)

;行番号表示
(global-linum-mode t)

;show paren mode
(show-paren-mode 1)
(setq show-paren-delay 0.5)
(setq show-paren-style 'mixed)
(set-face-foreground 'show-paren-match-face nil)
(set-face-background 'show-paren-match-face nil)
(set-face-underline  'show-paren-match-face "929292")
;(set-face-attribute 'show-paren-match-face nil
;                    :underline "#929292" :weight 'extra-bold)


;;regionの色(選択範囲の色)
(set-face-background 'region "gray30")
(set-face-foreground 'region "snow")

;;window size
(setq default-frame-alist
      (append (list '(width . 95)
		    '(height . 74)
		    '(left . -100 )
		    '(foreground-color . "snow");;文字色
		    '(background-color . "gray12");;背景色
		    '(border-color . "gray12")
		    '(cursor-color . "thistle1");;カーソル色
;		    '(cursor-type . hairline-caret);;カーソルの表示
		    ;;スクロールバーを消す
		    '(vertical-scroll-bars . nil)
		    )
	      default-frame-alist)
)

;;カーソルの表示
(setq default-cursor-type 'bar)

;; モードラインの背景文字設定
(set-face-foreground 'modeline "snow")
(set-face-background 'modeline "gray35")

;; 非アクティブ モードライン
(set-face-foreground  'mode-line-inactive "gray95")
(set-face-background  'mode-line-inactive "gray60")

 ;; キーワード
;;コメント
;(set-face-foreground  'font-lock-comment-face       "goldenrod2" )
(set-face-foreground  'font-lock-comment-face       "lightcoral" )
;;文字列など
(set-face-foreground  'font-lock-string-face        "DarkOrange" )
;;予約語(if for)
(set-face-foreground  'font-lock-keyword-face       "cyan" )
;;組み込み関数( #define , #include )
(set-face-foreground  'font-lock-builtin-face       "MediumSpringGreen" )
;;関数名
(set-face-foreground  'font-lock-function-name-face "LimeGreen" )
;;変数名
(set-face-foreground  'font-lock-variable-name-face "magenta" )
;;型(int)とか
(set-face-foreground  'font-lock-type-face          "moccasin"    )
;;定数のなまえ( class::hoge の class部分とか std とか)
(set-face-foreground  'font-lock-constant-face      "moccasin" )
;;独特な構文や別のテキストの意味を大きく変えるようなものに 使われる
(set-face-foreground  'font-lock-warning-face       "red"       )

;;emacs
;;etc/apt/source.listに以下を追記
;;deb http://ftp.jp.debian.org/debian-backports squeeze-backports main contrib non-free
;;apt-get update
;;apt-get install ibus-mozc
;;bashrcに以下を記載（いらないかも）
;;export GTK_IM_MODULE="ibus"
;;export XMODIFIERS="@im=ibus"
;;export QT_IM_MODULE="ibus"

;;http://darkblue11sky.seesaa.net/article/202538420.html
;;ここを参考に
;;emacsで使う分にはいらないかも
;;Bus上でMozcを動作させるときの設定は以下の手順で行います。
;;1.「システム→ 設定→ ibusの設定」で「IBusの設定」ウインドウを開く。
;;2.「インプットメソッド」タブをクリックしてウインドウを切り替える。
;;3.「インプットメソッドの選択→ 日本語→ Mozc」でMozcを選択し、 [追加]をクリックして下の「インプットメソッド」のリストにMozcを追加する。

;;apt-get install emacs-mozc
;;mozc

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
;;変換候補をぶら下げる
(setq mozc-candidate-style 'overlay)

;UTF-8
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)


;;auto-install
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/auto-install/"))
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)


(add-to-list 'load-path "~/.emacs.d/auto-install")

;; auto-installをいれてから
;; M-x auto-install-batchでインストール
;; anything
(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything)


;; php-mode
;; M-x auto-install-from-url
;; http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el
;(require 'php-mode)

;(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする
;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する

;; web-mode
;; http://web-mode.org/
;; wget して ロードパスに追加
(add-to-list 'load-path "~/.emacs.d/elisp/web-mode/")
(require 'web-mode)

;;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$"       . web-mode))
;;; インデント数
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))
(add-hook 'web-mode-hook 'web-mode-hook)

;; auto-complete
;; wget http://cx4a.org/pub/auto-complete/auto-complete-1.3.1.zip
;; emacs を起動
;; M-x load-file RET
;; Downloadして展開した先の etc/install.el を指定
;; install先を指定 defaultは.emacs.d/
;; 画面に表れる設定をinit.elに記入


(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete//ac-dict")
(ac-config-default)

;; popwin.el
;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;; M-x auto-install-from-url 
;; https://github.com/m2ym/popwin-el/raw/master/popwin.el

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(setq anything-samewindow nil)
(push '("*anything*" :height 10) popwin:special-display-config)
(push '("*Warnings*" :height 10) popwin:special-display-config)


