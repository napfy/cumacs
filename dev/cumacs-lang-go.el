(cumacs-require-package 'go-mode)
(cumacs-require-package 'go-dlv)
(cumacs-require-package 'company-go)
(cumacs-require-package 'go-projectile)
(cumacs-require-package 'go-errcheck)
(cumacs-require-package 'go-snippets)
(cumacs-require-package 'lsp-mode)
(cumacs-require-package 'lsp-ui)
(cumacs-require-package 'company-lsp)

(lsp-ui-mode t)

(defun cumacs-golang-build ()
  (interactive)
  (compile (concat "go build -o "  (go-guess-gopath) "bin/" (file-name-sans-extension (buffer-name)) " -v " (buffer-file-name))))

(defun cumacs-golang-run ()
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(defun cumacs-golang-hook ()
  (company-mode t)
  (define-key go-mode-map (kbd "<f5>") 'cumacs-golang-build)
  (define-key go-mode-map (kbd "<f6>") 'cumacs-golang-run)
  (define-key go-mode-map (kbd "C-c .") 'lsp-find-implementation)
  (define-key go-mode-map (kbd "M-.") 'lsp-find-definition)
  (yas-minor-mode-on)
  (hs-minor-mode t)
  (lsp-deferred)
  (lsp-go-install-save-hooks))

(defun cumacs-golang-get ()
  (interactive)
  (let ((pkg (read-string "package url: ")))
    (shell-command (concat  "GOPROXY=https://goproxy.io GO111MODULE=on go get -u " pkg))))

(add-hook 'go-mode-hook 'cumacs-golang-hook)


(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))

(provide 'cumacs-lang-go)
