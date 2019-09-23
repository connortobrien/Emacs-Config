;;; package --- Summary
;;; Commentary

;;; Code:
(use-package magit :defer t)
(use-package forge
  :defer t
  :after magit)
(use-package diff-hl
  :init
  (global-diff-hl-mode))

(provide 'git-settings)
