;; el-getの設定
;; http://tarao.hatenablog.com/entry/20150221/1424518030
;; 設定fileの場所を動的に指定できる
;; emacs -q -l ~/path/to/somewhere/init.el
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path (locate-user-emacs-file  "el-get-user/recipes"))
(el-get 'sync)

;; el-get packages
(el-get-bundle init-loader)

(el-get-bundle company-mode)
(el-get-bundle swiper) ;; for counsel
(el-get-bundle multiple-cursors)
(el-get-bundle magit)
(el-get-bundle emacs-neotree)
(el-get-bundle exec-path-from-shell)
(el-get-bundle flycheck)
(el-get-bundle ace-jump-mode)
(el-get-bundle expand-region)

;;言語系
;;; rust
(el-get-bundle f) ;; for emacs-racer
(el-get-bundle emacs-racer)
(el-get-bundle flycheck-rust)

;;; cc
(el-get-bundle cc-mode)
(el-get-bundle cmake-mode)

;; 表示系
(el-get-bundle moe-theme)
(el-get-bundle powerline)
(el-get-bundle Fanael/rainbow-delimiters)

;; init
(init-loader-load (locate-user-emacs-file "inits"))
