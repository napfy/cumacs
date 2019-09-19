(cumacs-require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(cumacs-require-package 'company-quickhelp)
(setq company-minimum-prefix-length 2)
(setq company-dabbrev-time-limit 2)
(setq company-dabbrev-code-time-limit 2)
(setq company-idle-delay 0.8)
(setq company-tooltip-limit 16)
(setq company-quickhelp-mode t)
(setq company-quickhelp-local-mode t)

(company-quickhelp-mode)

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-indent-or-complete-common)
     (define-key company-active-map (kbd "M-n") nil)
     (define-key company-active-map (kbd "M-p") nil)
     (define-key company-active-map (kbd "C-n") #'company-select-next)
     (define-key company-active-map (kbd "C-p") #'company-select-previous)))

(defun company-ac-setup ()
  "Sets up `company-mode' to behave similarly to `auto-complete-mode'."
  (setq company-require-match nil)
  (setq company-auto-complete nil)
  (setq company-frontends '(company-echo-metadata-frontend
                            ;company-pseudo-tooltip-unless-just-one-frontend-with-delay
                            company-pseudo-tooltip-unless-just-one-frontend
                            company-preview-frontend))

  (define-key company-mode-map (kbd "C-<tab>") #'company-yasnippet))

(company-ac-setup)

(setq company-backends
      '(company-files company-capf company-keywords company-abbrev company-dabbrev)) 


(provide 'cumacs-company)
