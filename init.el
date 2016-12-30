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

;; https://masutaka.net/chalow/2015-06-17-1.html
;; el-getで入れるpackageの設定
;; util
(el-get-bundle init-loader)
(el-get-bundle company-mode)
(el-get-bundle helm)
(el-get-bundle helm-git-grep)
(el-get-bundle helm-ls-git)
(el-get-bundle kyagi/shell-pop-el)
(el-get-bundle exec-path-from-shell)
(el-get-bundle yasnippet)

;; 言語系
(el-get-bundle ruby-mode)
(el-get-bundle ruby-block)
(el-get-bundle ruby-end)
(el-get-bundle yaml-mode)
(el-get-bundle web-mode)
(el-get-bundle js2-mode)

;; for scala
(el-get-bundle dash)
(el-get-bundle s)
(el-get-bundle popup)
(el-get-bundle ensime/emacs-sbt-mode)
(el-get-bundle ensime/emacs-scala-mode)
(el-get-bundle ensime/ensime-emacs)


;; mode
(el-get-bundle moe-theme)

;; init
(init-loader-load "~/.emacs.d/inits")
