# cumacs
A out of box emacs config for Chinese developer.
一个开箱即用的Emacs配置。
[查看使用说明](https://github.com/napfy/cumacs/wiki)

## 前言
Emacs作为一款知名的“编辑器”，因为它的上手难度太高，并未被许多开发者使用。
作为一个长期使用Emacs的开发者，我并不建议所有人都放弃现有的开发工具转而学习和使用Emacs。但我想说，如果你长期使用计算机编写代码，你期待高效率的工作，你期待更高的掌控力和自由度，我向你推荐它。

## 最新改进
    支持Emacs27

## 目标
- 持续改善使用体验 
主要包括对基础操作，界面，交互性等方面的改进
- 便于个人定制
让人更容易按照自己的使用偏好定制独特的版本
- 增强对宏的使用
对于某些需要重复执行的操作和指令，宏显得非常有用

## 配置说明
cumacs使用了简单的目录结构来划分不同配置的功能定位，这有助于根据个人的偏好进行定制。cumacs未来也将朝这个方向演进。
- base目录 基础配置
- dev目录 与开发相关的配置
- os目录 操作系统相关设置
- snippets目录 自定义的yasnippets
- elisp目录 放置不在官方package中的第三方elisp程序

## 有任何问题、建议和想法？
请发邮件到yue.f#qq.com，欢迎提出好的问题想法或批评指导

## 所使用的package
cumacs整合了许多成熟的package，以下是当前所使用的一些package:
- doom-modeline
- exec-path-from-shell
- company
- company-quickhelp
- ibuffer
- rainbow-delimiters
- rainbow-mode
- paredit
- smartparens
- which-key
- neotree
- dash
- helm
- helm-swoop
- undo-tree
- ace-jump-mode
- ace-jump-buffer
- avy
- ivy
- frog-jump-buffer
- projectile
- helm-projectile
- multiple-cursors
- pretty-mode
- expand-region
- ace-window
- imenu-list
- rg
- eyebrowse
- helm-posframe
- pretty-hydra
- major-mode-hydra
- ivy-posframe
- flycheck
- restclient
- dumb-jump
- magit
- docker
- dockerfile-mode
- markdown-mode
- toml-mode
- yaml-mode
- js2-mode
- js2-refactor
- cargo
- flycheck-rust
- tide
- restclient
- company-restclient
- yasnippet
- emmet-mode
- web-mode
- css-mode
- prettier-js
- npm-mode
- rust-mode
- less-css-mode
- scss-mode
- company-web
