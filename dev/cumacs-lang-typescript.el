(cumacs-require-package 'tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (hs-minor-mode t)
  (yas-minor-mode t)
  (setq typescript-indent-level 2)
  (setq tide-always-show-documentation t)
  (setq tide-completion-enable-autoimport-suggestions t)
  (define-key tide-mode-map (kbd "C-c d") 'tide-documentation-at-point)
  (define-key tide-mode-map (kbd "C-c c") 'tide-rename-symbol)
  (define-key tide-mode-map (kbd "C-c v") 'tide-refactor)
  (define-key tide-mode-map (kbd "C-c .") 'tide-jump-to-implementation)
  (define-key js2-mode-map (kbd "<f1>") 'cumacs-tide-documentation-at-point)
  (company-mode +1)
  (font-lock-mode t))

(defun cumacs-tide-documentation-at-point ()
  "Show documentation of the symbol at point."
  (interactive)
  (tide-command:quickinfo
   (tide-on-response-success-callback response
     (-if-let (body (tide-construct-documentation (plist-get response :body)))
         (pos-tip-show-no-propertize body 'tooltip nil nil 1000)
       (message "No documentation available.")))))


(add-hook 'js2-mode-hook #'setup-tide-mode)

(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;(setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
(provide 'cumacs-lang-typescript)
