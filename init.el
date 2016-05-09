;; el-getの設定
;; http://tarao.hatenablog.com/entry/20150221/1424518030
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; el-getで入れるpackageの設定
;; util
(el-get-bundle init-loader)
(el-get-bundle company-mode)
(el-get-bundle helm)
(el-get-bundle helm-git-grep)
(el-get-bundle helm-ls-git)
(el-get-bundle popwin)

;; 言語系


;; init
(init-loader-load "~/.emacs.d/inits")
