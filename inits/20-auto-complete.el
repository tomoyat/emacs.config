;; M-x package-install ¥n auto-complete
;;auto-complete-modeの読み込み
(require 'auto-complete-config)
(ac-config-default)
(setq ac-delay 0.1)
(setq ac-auto-show-menu 0.2)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/elpa/auto-complete-20131128.233/dict")

;; 補完メニュー表示時に C-n/C-pで補完候補を選択する
(setq ac-use-menu-map t)
