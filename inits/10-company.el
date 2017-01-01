(add-hook 'prog-mode-hook 'company-mode)

;; 自動補完を offにしたい場合は, company-idle-delayを nilに設定する
;; auto-completeでいうところの ac-auto-start にあたる.
(custom-set-variables
 '(company-idle-delay 0.05))
(custom-set-variables
 '(company-minimum-prefix-length 1)) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
