(cumacs-require-package 'yasnippet)

(setq yas-prompt-functions '(yas-completing-prompt))
(yas-load-directory (concat cumacs-dir "/snippets"))
(setq yas-also-indent-empty-lines t)
(setq yas-also-auto-indent-first-line t)
(yas-global-mode 1)
(provide 'cumacs-yasnippet)
