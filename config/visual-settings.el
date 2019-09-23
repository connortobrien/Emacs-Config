;;; package --- Summary
;;; Commentary

;;; Code:
(use-package all-the-icons)
(use-package gruvbox-theme)
  ; :config
  ; (load-theme 'gruvbox t))
(use-package doom-themes
	:config
	(load-theme 'doom-one t))

(use-package powerline
  :config
  (powerline-center-evil-theme))

(provide 'visual-settings)
