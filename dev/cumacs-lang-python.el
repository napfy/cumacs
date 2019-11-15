(cumacs-require-package 'elpy)
(elpy-enable)

(defun cumacs-python-hook ()
  (hs-minor-mode t)
  (yas-minor-mode t)
  (company-mode t)
  (define-key python-mode-map (kbd "<f1>") 'cumacs-python-doc-at-point)
  (define-key elpy-mode-map (kbd "M-.") 'elpy-goto-definition-or-rgrep))

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'python-mode-hook 'cumacs-python-hook)

(defun elpy-goto-definition-or-rgrep ()
  "Go to the definition of the symbol at point, if found. Otherwise, run `elpy-rgrep-symbol'."
    (interactive)
    (ring-insert find-tag-marker-ring (point-marker))
    (condition-case nil (elpy-goto-definition)
        (error (elpy-rgrep-symbol
                (concat "\\(def\\|class\\)\s" (thing-at-point 'symbol) "(")))))

(defun cumacs-python-doc-at-point ()
  (interactive)
  (let ((doc nil))
    (unless current-prefix-arg
      (setq doc (elpy-rpc-get-docstring))
      (unless doc
        (save-excursion
          (python-nav-backward-up-list)
          (setq doc (elpy-rpc-get-docstring))))
      (unless doc
        (setq doc (elpy-rpc-get-pydoc-documentation
                   (elpy-doc--symbol-at-point))))
      (unless doc
        (save-excursion
          (python-nav-backward-up-list)
          (setq doc (elpy-rpc-get-pydoc-documentation
                     (elpy-doc--symbol-at-point))))))
    (unless doc
      (setq doc (elpy-rpc-get-pydoc-documentation
                 (elpy-doc--read-identifier-from-minibuffer
                  (elpy-doc--symbol-at-point)))))
     (if doc
        (pos-tip-show-no-propertize doc 'tooltip nil nil 1000)
      (error "No documentation found"))))


(defun company-yasnippet-or-completion ()
  "Solve company yasnippet conflicts."
  (interactive)
  (let ((yas-fallback-behavior
         (apply 'company-complete-common nil)))
    (yas-expand)))

(add-hook 'company-mode-hook
          (lambda ()
            (substitute-key-definition
             'company-complete-common
             'company-yasnippet-or-completion
             company-active-map)))

(major-mode-hydra-define python-mode (:quit-key "q" :color pink :exit t)
  (" 运行 "
   (("r" (elpy-shell-send-region-or-buffer)  "运行程序")
    ("e" (elpy-shell-send-statement)  "执行语句")
    ("k" (progn (elpy-shell-switch-to-shell) (elpy-shell-kill) (delete-window))  "关闭交互窗口"))
   " 重构 "
   (("m" (elpy-multiedit-python-symbol-at-point) "重命名")
    ("f" (elpy-format-code) "格式化"))   
   " 测试 "
   (("t" (elpy-test) "测试"))
   " 调试 "
   (("d" (elpy-pdb-debug-buffer) "调试"))  
   ))

(provide 'cumacs-lang-python)
