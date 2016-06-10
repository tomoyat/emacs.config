;(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)
;(global-company-mode +1) ; 全バッファで有効にする

;; 自動補完を offにしたい場合は, company-idle-delayを nilに設定する
;; auto-completeでいうところの ac-auto-start にあたる.
(custom-set-variables
 '(company-idle-delay 0.1))
(custom-set-variables
 '(company-minimum-prefix-length 2)) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る


;; C-n, C-pで補完候補を次/前の候補を選択
            company-active-map
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;;優先順位の調整
;;http://qiita.com/sune2/items/b73037f9e85962f5afb7
(setq company-transformers '(company-sort-by-statistics company-sort-by-backend-importance))
