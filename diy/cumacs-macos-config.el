(cumacs-require-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(setq file-name-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-emacs)
(prefer-coding-system 'utf-8-emacs)
(set-terminal-coding-system 'utf-8-emacs)
(set-keyboard-coding-system 'utf-8-emacs)
;;使用win外接键盘时设置
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

(set-face-font 'default (font-spec :family "Inconsolata" :size 18))
(set-fontset-font t 'han (font-spec :family "WenQuanYi Micro Hei" :size 18))