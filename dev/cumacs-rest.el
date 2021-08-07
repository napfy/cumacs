(cumacs-require-package 'restclient)
(cumacs-require-package 'company-restclient)


(major-mode-hydra-define restclient-mode (:quit-key "x" :color pink)
  ("命令"
   (("r" restclient-http-send-current "请求当前地址")
    ("n" restclient-jump-next "下一个查询地址")
    ("p" restclient-jump-prev "上一个查询地址")
    ("x" keyboard-quit "退出")
    )))


(defun cumacs-rest-hook ()
  (message "cumacs-rest run")
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-restclient)
  (define-key restclient-mode-map (kbd "RET") 'cumacs-newline-no-indent))

(add-hook 'restclient-mode-hook 'cumacs-rest-hook)
(provide 'cumacs-rest)
