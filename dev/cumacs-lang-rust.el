(cumacs-use-package 'rust-mode)
(cumacs-require-package 'cargo)
(cumacs-require-package 'flycheck-rust)
(require 'company-lsp)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(add-hook 'cumacs-rust-mode-hook 'eldoc-mode)
(add-hook 'cumacs-rust-mode-hook 'company-mode)

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
  (lsp 1)
  (define-key rust-mode-map (kbd "<f5>") 'cargo-process-build)
  (define-key rust-mode-map (kbd "<f6>") 'cargo-process-run)
  (define-key rust-mode-map (kbd "<M-f5>") 'cumacs-rustc)
  (define-key rust-mode-map (kbd "<M-f6>") 'cumacs-rust-run))


(defun cumacs-rustc ()
  (interactive)
  (compile (concat "rustc " (buffer-name))))

(defun cumacs-rust-run ()
  (interactive)
  (compile (concat "./" (file-name-sans-extension (buffer-name)))))

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook 'cumacs-rust-hook)

(provide 'cumacs-lang-rust)

