;(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)
;(global-company-mode +1) ; 全バッファで有効にする

;; 自動補完を offにしたい場合は, company-idle-delayを nilに設定する
;; auto-completeでいうところの ac-auto-start にあたる.
(custom-set-variables
 '(company-idle-delay 0.05))
(custom-set-variables
 '(company-minimum-prefix-length 2)) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る


;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;; 色
(set-face-attribute 'company-tooltip nil :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil :background "orange")
(set-face-attribute 'company-scrollbar-bg nil :background "gray40")
(set-face-attribute 'company-tooltip-annotation nil :foreground "cyan" :background "lightgrey")
