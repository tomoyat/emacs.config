; M-x package-install or M-x package-list-packages
; go-mode
; go-autocomplete

; goのpathを通す
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin"))
; GOPATHにpathを通す
(add-to-list 'exec-path (expand-file-name "~/workspace/go-space/bin"))

; go-modeの設定
; setq indent-tabs-mode nilにするとtabじゃなくてspaceになる
(add-hook 'go-mode-hook
          '(lambda()
	     (setq tab-width 4)
	     (setq standard-indent 4) 
	     (setq indent-tabs-mode t)
	     (local-set-key (kbd "C-c d") 'godoc)))

; gocodeを使用
; go get -u github.com/nsf/gocode
(require 'go-autocomplete)
(require 'auto-complete-config)

; save時にautoで整形する
(add-hook 'before-save-hook 'gofmt-before-save)

; flymake-go
; go get -u github.com/dougm/goflymake
(add-to-list 'load-path "~/workspace/go-space/src/github.com/dougm/goflymake")
(require 'go-flymake)

; flymakeのショートカット
; M-x describe-bindingsでkey bindを調べられる
; C-c eでエラーを表示
;(define-key go-mode-map (kbd "C-c C-e") 'flymake-display-err-menu-for-current-line)
;; エラー内容を出力する関数を定義
(defun flymake-display-err-minibuf () 
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
      (setq count (1- count)))))
(define-key go-mode-map (kbd "C-c C-e") 'flymake-display-err-minibuf)
(define-key go-mode-map (kbd "C-c C-n") 'flymake-goto-next-error)
(define-key go-mode-map (kbd "C-c C-p") 'flymake-goto-prev-error)

