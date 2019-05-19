;;; package --- Summary
					; ============== START CONFIG =============
;;; Commentary:

					; Minimal UI
;;; Code:
(setq-default display-line-numbers-type 'visual
	      display-line-numbers-current-absolute t)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq inhibit-splash-screen t initial-scratch-message nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq tab-width 2)
(set-frame-font "Dank Mono 13")

					; List package archives
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

					; Get use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

					; EVIL
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))
(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (setq evil-leader/in-all-states 1)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key "c" 'compile)
  (evil-leader/set-key "m" 'magit-status)
  (evil-leader/set-key "sb" 'ido-switch-buffer)
  (evil-leader/set-key "sc" 'org-capture)
  (evil-leader/set-key "k" 'ido-kill-buffer)
  (evil-leader/set-key "n" 'neotree-toggle)
  (evil-leader/set-key "p" 'projectile-command-map))
(use-package evil-surround
  :config
  (global-evil-surround-mode))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package evil-magit :after evil magit)

					; Visuals
(use-package powerline-evil :after powerline)
(use-package powerline
  :init
  (setq powerline-default-separator 'slant)
  (setq powerline-evil-tag-style 'verbose)
  (custom-set-faces
   '(powerline-evil-normal-face ((t (:background "#79740E" :foreground "#eee8d5"))))
   '(powerline-evil-insert-face ((t (:background "#076678" :foreground "#eee8d5"))))
   '(powerline-evil-visual-face ((t (:background "#cb4b16" :foreground "#eee8d5"))))
   '(powerline-evil-operator-face ((t (:background "#AF3A03" :foreground "#eee8d5"))))
   '(powerline-evil-replace-face ((t (:background "#9D0006" :foreground "#eee8d5"))))
   '(powerline-evil-motion-face ((t (:background "#8F3F71" :foreground "#eee8d5"))))
   '(powerline-evil-emacs-face ((t (:background "#427B58" :foreground "#eee8d5"))))
   )
  :config
  (powerline-evil-center-color-theme))
(use-package all-the-icons)
(use-package darktooth-theme
  :config
  (load-theme 'darktooth t))
(use-package color-theme-sanityinc-solarized :defer t)
(use-package gruvbox-theme :defer t)
(use-package neotree
  :after all-the-icons
  :commands (neotree-toggle)
  :bind
  :config
  (setq neo-window-fixed-size nil)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

					; Git
(use-package magit
  :config
  (global-set-key (kbd "C-x M-g") 'magit-dispatch)
  (global-set-key (kbd "C-x g") 'magit-status))
(use-package forge :after magit)
(use-package diff-hl
  :init
  (global-diff-hl-mode))

					; Helpful
(use-package ivy
  :config
  (ivy-mode 1)
  (setq enable-recursive-minibuffers t))
(use-package flycheck
  :init (global-flycheck-mode))
(use-package projectile
  :config
  (setq projectile-require-project-root nil)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '("~/Projects/"))
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

					; Language specific
(use-package web-mode :defer t)
(use-package json-mode :defer t)
(use-package js2-mode
  :defer t
  :config
  (setq js2-strict-missing-semi-warning nil))
(use-package rjsx-mode :defer t)
(use-package tide
  :config
  (setq tide-format-options '(:indentSize 2 :tabSize 2))
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-before-save)))
(use-package vue-mode
  :defer t
  :config
  ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
  (setq mmm-submode-decoration-level 0))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
	  (lambda ()
	    (when (string-equal "tsx" (file-name-extension buffer-file-name))
	      (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

					; ================ END CONFIG ================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(package-selected-packages
   (quote
    (git-gutter-fringe forge gruvbox-theme evil-magit evil-collection evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-evil-emacs-face ((t (:background "#6c71c4" :foreground "#eee8d5"))))
 '(powerline-evil-insert-face ((t (:background "#268bd2" :foreground "#eee8d5"))))
 '(powerline-evil-motion-face ((t (:background "#d33682" :foreground "#eee8d5"))))
 '(powerline-evil-normal-face ((t (:background "#859900" :foreground "#eee8d5"))))
 '(powerline-evil-operator-face ((t (:background "#2aa198" :foreground "#eee8d5"))))
 '(powerline-evil-replace-face ((t (:background "#dc322f" :foreground "#eee8d5"))))
 '(powerline-evil-visual-face ((t (:background "#cb4b16" :foreground "#eee8d5")))))
