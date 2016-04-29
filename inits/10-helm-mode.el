(helm-mode 1)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)

;; tabでfind filesできるように
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; tabを連続して押した時に、file名が間違ってるとからファイルができるらしいのでそれを防ぐ
;; http://d.hatena.ne.jp/a_bicky/20140104/1388822688
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

;; gitから検索
(global-set-key (kbd "C-x g f") 'helm-git-files)
;; git grep
(global-set-key (kbd "C-x g g") 'helm-git-grep)
