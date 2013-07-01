;; ssh tramp
;; ssh config を設定して
;; sshx:user@configHostName:/~~

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-install")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-highlight")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete-1.3.1")
(add-to-list 'load-path "~/.emacs.d/site-lisp/smartCompile")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")

(set-language-environment 'Japanese)

(add-to-list 'default-frame-alist '(font . "ricty-13.5"))

(load-theme 'misterioso)

;;mozc set up
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;;選択行ハイライト
;(defface hlline-face
;  '((((class color)
;      (background dark))
;     (:background "pale green"))
;    (((class color)
;      (background light))
;     (:background "SeaGreen" :))
;    (t
;     ()))
;  "Used face hl-line.")
;(setq hl-line-face 'hlline-face)
;(global-hl-line-mode)

;;window size
(setq default-frame-alist
      (append (list '(width . 95)
		    '(height . 74)
		    '(left . -100 )
;		    '(border-color . "gray9")
		    '(cursor-color . "snow");;カーソル色
		    ;;'(cursor-type . hairline-caret);;カーソルの表示
		    ;;スクロールバーを消す
		    '(vertical-scroll-bars . nil)
		    )
	      default-frame-alist)
)
;http://d.hatena.ne.jp/kiki114/20100829/1283060821
;http://d.hatena.ne.jp/supermassiveblackhole/20100630/1277879145
;(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;;;vc-modeを無効にしておく
;;;emacsにgit等は操作させるつもりがないので
(setq vc-handled-backends ())

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

;;選択範囲ハイライト
(transient-mark-mode t)

;; Ctrl-Z
(define-key global-map "\C-z" 'undo)

;;stop beep sound
(setq visible-bell t)

;;linum mode 
(global-linum-mode t)

;;package
;;(require 'package)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;(package-initialize)


;;auto-highlight
;;https://github.com/mitsuo-saito/auto-highlight-symbol-mode
;;http://d.hatena.ne.jp/yuheiomori0718/20111222/1324562208
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; smart-compile.el
;; http://homepage.mac.com/zenitani/elisp-j.html#smart-compile
(require 'smart-compile)
(global-set-key "\C-cc" 'smart-compile)

;;auto-install
;; wget http://www.emacswiki.org/emacs/download/auto-install.el
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)


;; auto-installをいれてから
;; M-x auto-install-batchでインストール
;; anything
(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything)

;; popwin.el
;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;; M-x auto-install-from-url
;; https://github.com/m2ym/popwin-el/raw/master/popwin.el
(require 'popwin)
(popwin-mode 1)

(setq anything-samewindow nil)
(push '("*anything*" :height 10) popwin:special-display-config)
(push '("*Warnings*" :height 10) popwin:special-display-config)



;; web-mode
;; web-mode.org
;;; emacs 23以下の互換
(require 'web-mode)
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

(defun web-mode-hook () 
  "Hooks for Web mode." 
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
) 
(add-hook 'web-mode-hook 'web-mode-hook)

;; 色の設定
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))                          ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "#E6B422" :weight bold))))             ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "#C97586"))))                          ; 属性名など
;; '(web-mode-html-attr-value-face
;;   ((t (:foreground "#82AE46"))))                          ; 属性値
;; '(web-mode-comment-face
;;   ((t (:foreground "#D9333F"))))                          ; コメント
;; '(web-mode-server-comment-face
;;   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
)

(defun yas-web-mode-fix ()
  (if (string= major-mode "web-mode")
      (progn
        (web-mode-buffer-refresh)
        (indent-for-tab-command))))
(setq yas/after-exit-snippet-hook 'yas-web-mode-fix)

;; yasnippet
;; git clone https://github.com/capitaomorte/yasnippet
;; http://ochiailab.blogspot.jp/2012/12/yasnippet.html
(require 'yasnippet)
(custom-set-variables
 '(yas/snippet-dirs 
   '("~/.emacs.d/plugins/yasnippet/snippets"
     "~/.emacs.d/etc/snippets")))
(yas-global-mode 1)


;; 既存スニペットを挿入
(define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x y n") 'yas-new-snippet)
;; 既存スニペットの閲覧、編集
(define-key yas-minor-mode-map (kbd "C-x y v") 'yas-visit-snippet-file)
 
;; anything interface
(eval-after-load "anything-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (anything-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*anything yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
     (define-key anything-command-map (kbd "y") 'yas/insert-snippet)))


;;auto complete
;; M-x auto-complete-mode -> ON
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete-1.3.1/ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)
;; デフォルトで設定済み
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(add-to-list 'ac-modes 'web-mode)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; gtags
;; http://qiita.com/yewton@github/items/d9e686d2f2a092321e34






;; 
;; fly make
;; (require 'flymake)

;; (defun flymake-cc-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))


;; (defun flymake-c-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

;; (push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)

;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (flymake-mode t)))
;; (add-hook 'c-mode-hook
;;           '(lambda ()
;;              (flymake-mode t)))


