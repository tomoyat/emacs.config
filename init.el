; 参考になるところ
; http://shibayu36.hatenablog.com/entry/2013/12/03/213942
; https://github.com/shibayu36/emacs/tree/master/emacs.d

; 文字コード
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
        (expand-file-name "~/.emacs.d/elisp/")
	)
       load-path))

; package.el
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; M-x package-install ¥n init-loader
; init-loder
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
