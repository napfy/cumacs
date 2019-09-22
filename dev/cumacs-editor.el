(cumacs-require-package 'markdown-mode)
(cumacs-require-package 'toml-mode)

(cumacs-require-package 'yaml-mode)
(global-set-key (kbd "C-;") 'comment-line)

(setq org-default-notes-file (concat cumacs-dir "/notes.org"))
(global-set-key (kbd "C-c C-t") 'org-capture)


(defun cumacs/markdown-hook ()
  (define-key markdown-mode-map (kbd "C-c m b") 'markdown-insert-bold)
  (define-key markdown-mode-map (kbd "C-c m i") 'markdown-insert-italic)
  (define-key markdown-mode-map (kbd "C-c m c") 'markdown-insert-code)
  (define-key markdown-mode-map (kbd "C-c m l") 'markdown-insert-link)
  (define-key markdown-mode-map (kbd "C-c m m") 'markdown-insert-image)
  (define-key markdown-mode-map (kbd "C-c m h") 'markdown-insert-header)
  (define-key markdown-mode-map (kbd "C-c m k") 'markdown-insert-kbd)
  (define-key markdown-mode-map (kbd "C-c m s") 'markdown-insert-strike-through)
  (define-key markdown-mode-map (kbd "C-c m q") 'markdown-insert-blockquote)
  (define-key markdown-mode-map (kbd "C-c m p") 'markdown-insert-pre)
  (define-key markdown-mode-map (kbd "C-c m h") 'markdown-insert-header)
  (define-key markdown-mode-map (kbd "C-c m t") 'markdown-insert-table))

(add-hook 'markdown-mode-hook 'cumacs/markdown-hook)

(major-mode-hydra-define markdown-mode (:quit-key "q" :color pink)
  ("定位"
   (("n" (markdown-next-heading) "下一标题")
    ("p" (markdown-previous-heading) "上一标题"))
   "层级移动"
   (("k" (markdown-move-up) "向上一级")
    ("j" (markdown-move-down) "向下一级"))
   "层级升降"
   (("u" (markdown-promote) "升一级")
    ("d" (markdown-demote) "降一级"))))




(provide 'cumacs-editor)
;;; cumacs-editor.el ends here
