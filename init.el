;;; package --- Summary
;;; Commentary:

;;; Code:
;; List package archives
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t initial-scratch-message nil)

(setq-default display-line-numbers-type 'visual
  display-line-numbers-current-absolute t)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; (setq inhibit-splash-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq-default indent-tabs-mode t)
(setq-default tab-width 2)
(set-frame-font "Dank Mono 13")

(add-to-list 'load-path "~/.emacs.d/config")

(load "evil-settings.el")
(load "git-settings.el")
(load "visual-settings.el")
(load "language-settings.el")
(load "navigation-settings.el")

;; ================ END CONFIG ================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" default)))
 '(package-selected-packages
	 (quote
		(doom-themes treemacs-evil treemacs doom-modeline web-mode use-package tide solarized-theme rjsx-mode projectile powerline-evil neotree monokai-theme json-mode helm gruvbox-theme go-mode general forge flatland-theme evil-magit evil-collection elixir-mode diff-hl darktooth-theme all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
