;;; package --- Summary
;;; Commentary

;;; Code:
(use-package treemacs)
(use-package treemacs-evil)

(use-package helm
  :defer t
  :config
  (helm-mode 1))

(use-package projectile
  :after helm
  :defer t
	:general
	(tyrant-def "p" 'projectile-command-map)
  :config
  (setq projectile-require-project-root nil)
  (setq projectile-completion-system 'helm)
  (setq projectile-project-search-path '("~/Projects/"))
	:init
	(projectile-mode +1))

(provide 'navigation-settings)
