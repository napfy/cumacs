(cumacs-require-package 'docker)
(cumacs-require-package 'dockerfile-mode)
(global-set-key (kbd "C-c C-d d") 'docker)
(global-set-key (kbd "C-c C-d c") 'docker-compose)

(defun cumacs-docker-hook ()
  (yas-minor-mode)
  (company-mode-on))

(add-hook 'dockerfile-mode-hook 'cumacs-docker-hook)

(add-hook 'dockerfile-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends)
		 (add-to-list 'company-backends #'company-yasnippet))))

(provide 'cumacs-docker)
