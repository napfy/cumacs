(cumacs-require-package 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(cumacs-require-package 'rainbow-delimiters)
(cumacs-require-package 'rainbow-mode)

(cumacs-require-package 'paredit)

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(global-set-key (kbd "M-[") 'paredit-backward)
(global-set-key (kbd "M-]") 'paredit-forward)

(cumacs-require-package 'smartparens)
(require 'smartparens-config)

(cumacs-require-package 'which-key)
(which-key-mode)
(setq which-key-idle-delay 0.3)


(cumacs-require-package 'neotree)
(defun cumacs-neotree-toggle ()
  (interactive)
  (if (neo-global--window-exists-p)
				    (neotree-hide)
				  (progn (neotree-find) (neotree-show))))
(global-set-key (kbd "<f8>") 'cumacs-neotree-toggle)

(cumacs-require-package 'dash)

(cumacs-require-package 'helm)
(helm-mode)
(global-set-key (kbd "C-c i") 'helm-imenu)
(global-set-key (kbd "C-x b") 'helm-multi-files)
(global-set-key (kbd "C-c r") 'helm-do-grep)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-command)
(setq helm-input-idle-delay 0.1)


(cumacs-require-package 'helm-swoop)

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "C-c s") 'helm-multi-swoop-projectile)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-horizontally)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;; ;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)

;; Optional face for line numbers
;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)

;; If you prefer fuzzy matching
(setq helm-swoop-use-fuzzy-match nil)


(cumacs-require-package 'undo-tree)
(global-undo-tree-mode t)

(cumacs-require-package 'ace-jump-mode)
(global-set-key (kbd "C-c j") 'ace-jump-mode)
(cumacs-require-package 'ace-jump-buffer)

(cumacs-require-package 'avy)
(avy-setup-default)


(cumacs-require-package 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(cumacs-require-package 'frog-jump-buffer)
(global-set-key (kbd "C-c b") 'frog-jump-buffer)
(setq frog-jump-buffer-max-buffers 32)
(setq frog-jump-buffer-posframe-handler 'posframe-poshandler-frame-center)
(setq frog-jump-buffer-default-filters-capital-letters nil)
(setq frog-jump-buffer-use-default-filter-actions t)
(setq frog-jump-buffer-current-filter-function 'frog-jump-buffer-filter-same-mode)
(setq frog-jump-buffer-include-current-buffer nil)
(setq frog-jump-buffer-posframe-parameters
      '((internal-border-width . 10)
        (background-color . "gray10")
        ))


(cumacs-require-package 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)
;(global-set-key (kbd "C-c C-f") 'projectile-find-file)

(cumacs-require-package 'helm-projectile)
(global-set-key (kbd "C-c g") 'helm-projectile-grep)
(global-set-key (kbd "C-c f") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "C-c r") nil)
(cumacs-require-package 'multiple-cursors)
(global-set-key (kbd "C-c C-a") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)


(cumacs-require-package 'pretty-mode)

(cumacs-require-package 'expand-region)
(global-set-key (kbd "C-c e") 'er/expand-region)


(cumacs-require-package 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-minibuffer-flag t)
(setq aw-dispatch-always t)

(cumacs-require-package 'imenu-list)
(global-set-key (kbd "<f9>") 'imenu-list-smart-toggle)


(setq org-default-notes-file (concat cumacs-dir "/notes.org"))
(global-set-key (kbd "C-c C-t") 'org-capture)

(cumacs-require-package 'rg)
(rg-enable-default-bindings)

(defvar cumacs-grep-in-project
 (if (and rg-executable (file-exists-p rg-executable))
     'rg-project
    'project-find-regexp))

(global-set-key (kbd "C-c C-g") cumacs-grep-in-project)


(cumacs-require-package 'eyebrowse)
(eyebrowse-mode t)

(cumacs-require-package 'helm-posframe)
(helm-posframe-enable)

(setq helm-posframe-poshandler 'posframe-poshandler-frame-center)

(setq helm-posframe-parameters
      '((internal-border-width . 10)
        (background-color . "gray10")))


(cumacs-require-package 'pretty-hydra)
(cumacs-require-package 'major-mode-hydra)
(global-set-key (kbd "<f2>") #'major-mode-hydra)


(pretty-hydra-define cumacs-shortcut
  (:quit-key "q" :color pink)
  ("浏览"
   (("l" helm-buffers-list "Buffer列表")
    ("p" previous-buffer "上一Buffer")
    ("n" next-buffer "下一Buffer"))
   "搜索"
   (("r" rg-project "指定类型正则查找")
    ("s" project-find-regexp "指定目录正则查找")
    ("m" helm-multi-swoop-projectile "多文件的查找替换"))
   
   "      窗口切换"
   (("j" eyebrowse-next-window-config "下一状态")
    ("k" eyebrowse-prev-window-config "上一状态")
    ("t" eyebrowse-switch-to-window-config "指定配置"))
   "     窗口状态"
   (("w" eyebrowse-create-window-config "保存状态")
    ("d" eyebrowse-close-window-config "移除状态")
    ("x" delete-window "关闭窗口"))
   "    窗口大小"
   ((">" enlarge-window-horizontally "横向扩展")
    ("<" shrink-window-horizontally "横向缩小")
    ("h" split-window-horizontally "横向分隔"))
   "    代码折叠"
   (("," hs-hide-all "折叠全部")
    ("." hs-show-all "展开全部")
    ("/" hs-toggle-hiding "折叠当前"))
   "    开发工具"
   (("c" eshell "命令行")
    ("e" restclient-mode "Rest客户端")
    ("g" magit-status "Git客户端"))
   "   实用功能"
   (("b" browse-web "浏览网址")
    ("o" org-capture "备忘录"))
   ))

(global-set-key (kbd "<C-escape>") 'cumacs-shortcut/body)

(cumacs-require-package 'ivy-posframe)

(setq ivy-posframe-display-functions-alist
      '((yas-expand . ivy-posframe-display-at-point)
        ))

(ivy-posframe-mode 1)
(setq ivy-posframe-border-width 2)
(setq ivy-posframe-hide-minibuffer t)
(setq ivy-posframe-min-width 32)
(setq ivy-posframe-min-height 10)

(provide 'cumacs-util)
