(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (savehist-mode 1))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t) ;; Emacs 31: partial-completion behaves like substring
  )

(use-package all-the-icons-completion
  :ensure t
  :after all-the-icons
  :init
  (all-the-icons-completion-mode 1)
  )
(use-package all-the-icons
  :ensure t)

(editorconfig-mode 1)

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  :hook (prog-mode . smartparens-mode))

(use-package ws-butler
  :ensure t
  :hook (prog-mode . ws-butler-mode))

(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :after transient)

(setq magit-define-global-key-bindings 'recommended)

(use-package diff-hl
  :ensure t
  :hook
  (text-mode . diff-hl-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(set-face-attribute 'default nil :font "JetBrains Mono Nerd Font-11")
(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :init
  (setq dashboard-startup-banner 'logo-braille)
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-items '((recents . 5)
			  (projects . 5)
			  (agenda . 5))))

(use-package org-auto-tangle
  :ensure t
  :hook (org-mode . org-auto-tangle-mode))

(use-package nix-mode
  :ensure t)
(use-package yaml-mode
  :ensure t)
