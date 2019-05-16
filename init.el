; ============== START CONFIG =============

; Minimal UI
(setq-default display-line-numbers-type 'visual
              display-line-numbers-current-absolute t)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq inhibit-splash-screen t
      initial-scratch-message nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

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
             (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
             :config
             (evil-mode 1))
(use-package evil-collection
             :after evil
             :config
             (evil-collection-init))
(use-package evil-magit :after evil magit)

; Visuals
(use-package powerline
             :config
             (powerline-center-evil-theme))
(use-package all-the-icons)
(use-package gruvbox-theme
             :config
             (load-theme 'gruvbox t))
(use-package neotree
             :after all-the-icons
             :bind (("C-x C-n" . neotree-toggle))
             :commands (neotree-toggle)
             :config
             (setq neo-window-fixed-size nil)
             (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

; Git
(use-package magit
             :config
             (global-set-key (kbd "C-x M-g") 'magit-dispatch)
             (global-set-key (kbd "C-x g") 'magit-status))
(use-package forge :after magit)
(use-package git-gutter-fringe
             :init (setq git-gutter-fr:side 'right-fringe))

; Language specific
(use-package tide
             :ensure t
             :after (typescript-mode company flycheck)
             :hook ((typescript-mode . tide-setup)
                    (typescript-mode . tide-hl-identifier-mode)
                    (before-save . tide-format-before-save)))
(use-package js2-mode :defer t)
(use-package rjsx-mode :defer t)
(use-package vue-mode
             :defer t
             :config
             ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
             (setq mmm-submode-decoration-level 0))

; ================ END CONFIG ================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (git-gutter-fringe forge gruvbox-theme evil-magit evil-collection evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
