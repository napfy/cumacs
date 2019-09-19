(cumacs-require-package 'emmet-mode)
(cumacs-require-package 'web-mode)
(cumacs-use-package 'less-css-mode)
(cumacs-use-package 'scss-mode)
(cumacs-use-package 'company-web)
(cumacs-require-package 'css-mode)
;;TODO check & prompt for stylelintrc file


(defun cumacs-web-hook ()
  (message "cumacs web hook")
  (define-key web-mode-map (kbd "M-n") 'emmet-next-edit-point)
  (define-key web-mode-map (kbd "M-p") 'emmet-prev-edit-point)
  (define-key web-mode-map (kbd "C-;") 'web-mode-comment-or-uncomment)
  (define-key web-mode-map (kbd "C-j") 'web-mode-auto-complete)  
  (yas-minor-mode t)
  (emmet-mode t)
  (company-mode-on)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'css-stylelint 'web-mode)
  (flycheck-add-mode 'html-tidy 'web-mode)
  (smartparens-mode t))


(defun cumacs/web-html-setup()
  "Setup for web-mode html files."
  (message "web html setup")
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-select-checker 'html-tidy)
  (set (make-local-variable 'company-backends)
       '(company-files company-css company-web-html))
  (add-hook 'before-save-hook #'sgml-pretty-print))

;;
;; web-mode for vue
;;
(defun cumacs/web-jsx-setup()
  "Setup for js related."
  (message "web jsx setup")
  (setup-tide-mode)
  (prettier-js-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-select-checker 'javascript-eslint)
  (cumacs/use-eslint-from-node-modules)
  (set (make-local-variable 'company-backends)
               '(company-files company-tide company-css company-web-html)))

(defun cumacs/use-eslint-from-node-modules ()
  "Use local eslint from node_modules before global."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'cumacs/use-eslint-from-node-modules)

(setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")
				     ("json" . "\\.json\\'")
				     ("vue" . "\\.vue\\'")))


(add-hook 'web-mode-hook 'cumacs-web-hook)
(add-hook 'web-mode-hook '(lambda ()
                            (if (equal web-mode-content-type "html")
                                (cumacs/web-html-setup)	  
                              (cumacs/web-jsx-setup))))
(add-hook 'sgml-mode-hook 'cumacs-web-hook)
(add-hook 'nxml-mode-hook 'cumacs-web-hook)
(add-hook 'html-mode-hook 'cumacs-web-hook)

(modify-coding-system-alist 'file "\\.html\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.tpl\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.css\\'" 'utf-8)

(autoload 'web-mode "web-mode" "web mode" t)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[sp]?html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-css-colorization t)

(setq web-mode-enable-comment-interpolation t)
(setq web-mode-enable-current-column-highlight t)


(setq emmet-move-cursor-between-quotes t)
(setq emmet-move-cursor-after-expanding t)


(defun cumacs-style-setup ()
  (rainbow-mode t)
  (emmet-mode t)
  (setq css-indent-offset 2)
  (smartparens-mode t)
  (push (make-local-variable 'company-backends)
	       '(company-css)))

(defun cumacs-css-hook ()
  (cumacs-style-setup)
  (flycheck-add-mode 'css-stylelint 'css-mode)
  (flycheck-select-checker 'css-stylelint))

(defun cumacs-scss-hook ()
  (cumacs-style-setup)
  (flycheck-add-mode 'scss-stylelint 'scss-mode)
  (flycheck-select-checker 'scss-stylelint))

(add-hook 'css-mode-hook 'cumacs-css-hook)
(add-hook 'scss-mode-hook 'cumacs-scss-hook)

(provide 'cumacs-web-mode)