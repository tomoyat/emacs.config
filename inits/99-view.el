;; rainbow-delimiters
;; https://github.com/Fanael/rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; https://github.com/kuanyui/moe-theme.el
(require 'powerline)
(require 'moe-theme)
(setq moe-theme-highlight-buffer-id t)
(moe-light)
(powerline-moe-theme)
;;(moe-theme-random-color)
(moe-theme-set-color 'orange)
 ;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
