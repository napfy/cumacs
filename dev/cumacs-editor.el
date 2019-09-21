(cumacs-require-package 'markdown-mode)
(cumacs-require-package 'toml-mode)

(cumacs-require-package 'yaml-mode)
(global-set-key (kbd "C-;") 'comment-line)

(setq org-default-notes-file (concat cumacs-dir "/notes.org"))
(global-set-key (kbd "C-c C-t") 'org-capture)

(provide 'cumacs-editor)
;;; cumacs-editor.el ends here
