;; http://qiita.com/ongaeshi/items/3521b814aa4bf162181d
;; http://nishikawasasaki.hatenablog.com/entry/2012/12/31/094349
;; https://github.com/magnars/multiple-cursors.el

;; インストール方法
;; M-x package-list-packages
;; M-x package-install multiple-cursors
;; M-x package-install smartrep

;; 使用方法
;; 範囲選択をしてC-qで選択した範囲の先頭にカーソルをおく
;; 単語を選択してC-t -> n でカーソルを増やす
;; 単語を選択してC-t -> * で同じ単語にカーソルをおく

(require 'multiple-cursors)
(require 'smartrep)

(declare-function smartrep-define-key "smartrep")

(global-set-key (kbd "C-q") 'mc/edit-lines)

(global-unset-key "\C-t")

(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
))
