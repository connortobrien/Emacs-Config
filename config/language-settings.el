;;; package --- Summary
;;; Commentary

;;; Code:
(use-package elixir-mode :defer t)

(use-package go-mode :defer t)

(use-package docker
  :bind ("C-c d" . docker))
(use-package docker-tramp :defer t)

(use-package json-mode :defer t)
(use-package web-mode :defer t)
(use-package js2-mode
  :defer t
  :config
  (setq js2-basic-offset 2)
  (setq js2-strict-missing-semi-warning nil))
(use-package rjsx-mode :defer t)

(use-package typescript-mode :defer t
  :config
  (setq-default typescript-indent-level 2))
(use-package tide
  :defer t
  :after typescript-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
    (lambda ()
      (when (string-equal "tsx" (file-name-extension buffer-file-name))
        (setup-tide-mode))))
  (setq tide-format-options '(:indentSize 2 :tabSize 2)))

(provide 'language-settings)
