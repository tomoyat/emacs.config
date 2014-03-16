; M-x package install ¥n popwin
(setq pop-up-windows nil)
(require 'popwin nil t)
(setq popwin:close-popup-window-timer-interval 0.5)

(when (require 'popwin nil t)
  (setq anything-samewindow nil)
  (setq display-buffer-function 'popwin:display-buffer)
  (push '("anything" :regexp t :height 0.3) popwin:special-display-config))
