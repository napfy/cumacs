
(defun cumacs-elisp-hook()
  (hs-minor-mode)
  (turn-on-eldoc-mode)
  (enable-paredit-mode)
  (rainbow-mode)
  (rainbow-delimiters-mode)
  (define-key emacs-lisp-mode-map (kbd "<f5>") 'eval-buffer)
  (define-key emacs-lisp-mode-map (kbd "RET") 'newline-and-indent)
  (define-key emacs-lisp-mode-map (kbd "C-;") 'delete-horizontal-space)
  (global-font-lock-mode 1))

(add-hook 'emacs-lisp-mode-hook 'cumacs-elisp-hook)

(provide 'cumacs-lang-elisp)
