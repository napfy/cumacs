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
    ("f" project-find-regexp "指定目录正则查找")
    ("m" helm-multi-swoop-projectile "多文件的查找替换"))
   "      窗口切换"
   (("j" eyebrowse-next-window-config "下一状态")
    ("k" eyebrowse-prev-window-config "上一状态")
    ("i" eyebrowse-switch-to-window-config "指定配置"))
   "     窗口状态"
   (("w" eyebrowse-create-window-config "保存状态")
    ("z" eyebrowse-close-window-config "移除状态")
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
   (("s" eshell "命令行")
    ("e" restclient-mode "Rest客户端")
    ("g" magit-status "Git客户端"))
   "   部署运维"
   (("d" docker "Docker")
    ("c" docker-compose "Docker compose")
    ("t" helm-tramp "Tramp"))
   "实用功能"
   (("b" browse-web "浏览网址")
    ("o" org-capture "备忘录"))
   ))

(global-set-key (kbd "<C-escape>") 'cumacs-shortcut/body)

(provide 'cumacs-shortcut)
