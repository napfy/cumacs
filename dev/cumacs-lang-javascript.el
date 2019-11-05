(cumacs-require-package 'js2-mode)
;(cumacs-require-package 'prettier-js)
(cumacs-require-package 'js2-refactor)
(cumacs-require-package 'eslint-fix)

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json" . javascript-mode))
(autoload 'js2-mode "js2-mode" "Javascript mode" t)

(cumacs-use-package 'npm-mode)
(npm-global-mode)


(setq js-indent-level 2)
;(setq js2-global-externs '('("module" "require" "assert" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON")))
;; (setq prettier-js-args '("--trailing-comma" "all"
;; 			 "--bracket-spacing" "true" "--single-quote" "true"))

(setq js2-strict-missing-semi-warning nil)

(defun cumacs-javascript-hook()
  (js2r-add-keybindings-with-prefix "C-c r")
  (hs-minor-mode t)
  (yas-minor-mode t)
  (js2-refactor-mode t)
  (font-lock-mode t))

;; formats the buffer before saving
(setq js2-skip-preprocessor-directives t)

(add-hook 'js2-mode-hook 'cumacs-javascript-hook)

(defun cumacs-json-hook ()
  (flycheck-mode t)
  (hs-minor-mode t)
  (yas-minor-mode t))

(add-hook 'json-mode-hook 'cumacs-json-hook)

(eval-after-load 'js2-mode
	   '(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))

(major-mode-hydra-define js2-mode (:quit-key "q" :color pink :exit t)
  ("   Nodejs   "
   (("r" npm-mode-npm-run "运行")
    ("n" npm-mode-npm-init "新建")
    ("i" npm-mode-npm-install-save "安装")
    ("I" npm-mode-npm-install "安装依赖"))
   "   代码   "
   (("v" tide-refactor "TIDE重构"))   
   ))

(provide 'cumacs-lang-javascript)
