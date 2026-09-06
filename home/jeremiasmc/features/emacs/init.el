;; init.el --- Setup básico by Jere :P
(use-package auctex
  :ensure t
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t))

(use-package cdlatex
  :ensure t
  :hook
  ((LaTeX-mode . turn-on-cdlatex) 
   (org-mode . turn-on-org-cdlatex))) ;; Habilita cdlatex automáticamente en los buffers de LaTex y en los de org

(use-package nix-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package yaml-mode
  :ensure t)
