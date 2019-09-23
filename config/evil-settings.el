;;; package --- Summary
;;; Commentary

;;; Code:
(use-package evil
  :init
	(setq evil-move-cursor-back t)
  (setq evil-cross-lines t)
  (setq evil-want-fine-undo t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-w-in-emacs-state nil)
	(setq evil-want-C-w-delete t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
	(setq evil-want-Y-yank-to-eol t)
	:config
	(setq evil-split-window-below t
		evil-vsplit-window-right t)
  (evil-mode 1))

(use-package evil-surround
	:config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-magit :after evil)

(use-package which-key
	:config (which-key-mode 1))
(use-package general
	:after which-key
	:config
	(general-override-mode 1)
	(general-evil-setup t)

	(general-create-definer tyrant-def
    :states '(normal visual insert motion emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (general-create-definer despot-def
    :states '(normal insert)
    :prefix "SPC"
		:non-normal-prefix "C-SPC")

	(general-define-key
		:keymaps '(normal insert emacs)
		:prefix "SPC"
		:non-normal-prefix "M-SPC"
		:prefix-command 'my-prefix-command
		:prefix-map 'my-prefix-map
		"/" 'swiper)
)

(provide 'evil-settings)
