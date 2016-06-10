;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files '("~/workspace/til/memo.org"))

(setq org-capture-templates
      '(("m" "Memo" entry (file "~/workspace/til/memo.org") "* %T %?" :prepend t))
      )
