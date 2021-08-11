(cumacs-require-package 'pretty-hydra)
(cumacs-require-package 'major-mode-hydra)
(global-set-key (kbd "<f2>") #'major-mode-hydra)

(pretty-hydra-define cumacs-shortcut
  (:quit-key "q" :color pink)
  ("浏览"
   (("l" helm-buffers-list "Buffer列表" :exit t)
    ("p" previous-buffer "上一Buffer"  )
    ("n" next-buffer "下一Buffer" )
    ("<left>" (centaur-tabs-backward) "上一标签")
    ("<right>" (centaur-tabs-forward) "下一标签"))
   "搜索"
   (("r" rg-project "指定类型正则查找"  :exit t)
    ("f" project-find-regexp "指定目录正则查找"  :exit t)
    ("m" helm-multi-swoop-projectile "多文件的查找替换"  :exit t))
   "    窗口切换"
   (("j" eyebrowse-next-window-config "下一状态")
    ("k" eyebrowse-prev-window-config "上一状态")
    ("1" delete-other-windows "只看当前"))
   "    窗口状态"
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
   (("s" eshell "命令行"  :exit t)
    ("e" restclient-mode "Rest客户端"  :exit t)
    ("g" magit-status "Git客户端"  :exit t))
   "   部署运维"
   (("d" docker "Docker"  :exit t)
    ("c" docker-compose "Docker compose"  :exit t )
    ("t" helm-tramp "Tramp"  :exit t))
   " 实用功能"
   (("b" browse-web "浏览网址"  :exit t)
    ("o" org-capture "备忘录"  :exit t))
   ))

(global-set-key (kbd "M-`") 'cumacs-shortcut/body)

(provide 'cumacs-shortcut)
