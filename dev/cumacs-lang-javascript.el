(cumacs-require-package 'js2-mode)
(cumacs-use-package 'prettier-js)
(cumacs-require-package 'js2-refactor)

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json" . javascript-mode))
(autoload 'js2-mode "js2-mode" "Javascript mode" t)

(cumacs-use-package 'npm-mode)
(npm-global-mode)


(setq js-indent-level 2)
;(setq js2-global-externs '('("module" "require" "assert" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON")))
(setq prettier-js-args '("--trailing-comma" "all"
			 "--bracket-spacing" "false"))


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
  (yas-minor-mode t)
  (smartparens-mode t))

(add-hook 'json-mode-hook 'cumacs-json-hook)

(major-mode-hydra-define js2-mode (:quit-key "q" :color pink)
  ("   Nodejs   "
   (("r" npm-mode-npm-run "运行")
    ("n" npm-mode-npm-init "新建")
    ("i" npm-mode-npm-install-save "安装")
    ("I" npm-mode-npm-install "安装依赖"))
   "   代码   "
   (("v" tide-refactor "TIDE重构"))   
   ))



(provide 'cumacs-lang-javascript)
