(cumacs-use-package 'rust-mode)

(cumacs-require-package 'cargo)
(cumacs-require-package 'racer)
(cumacs-require-package 'flycheck-rust)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(add-hook 'racer-mode-hook 'eldoc-mode)
(add-hook 'racer-mode-hook 'company-mode)
(add-hook 'rust-mode-hook 'racer-mode)


(defun cumacs-cargo-search ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (re-search-forward "[a-z_\\-]+")
    (cargo-process-search (match-string 0))))

(defun cumacs-cargo-hook ()
  (define-key cargo-minor-mode-map (kbd "<f5>") 'cargo-process-run)
  (define-key cargo-minor-mode-map (kbd "<f6>") 'cargo-process-build)
  (define-key cargo-minor-mode-map (kbd "<f7>") 'cumacs-cargo-search))

(add-hook 'cargo-minor-mode-hook 'cumacs-cargo-hook)
(add-to-list 'auto-mode-alist '("Cargo.toml" . cargo-minor-mode))


(defun cumacs-rust-hook()
  (setq company-tooltip-align-annotations t)
  (hs-minor-mode t)
  (yas-minor-mode t)
  (define-key rust-mode-map (kbd "<f5>") 'cargo-process-run)
  (define-key rust-mode-map (kbd "<f6>") 'cargo-process-build)
  (define-key rust-mode-map (kbd "<f1>") 'racer-describe-tooltip))

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook 'cumacs-rust-hook)


(provide 'cumacs-lang-rust)

