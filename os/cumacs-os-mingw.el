(setq file-name-coding-system 'euc-cn)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)

(set-face-font 'default (font-spec :family "Inconsolata" :size 16))
(set-fontset-font t 'han (font-spec :family "Noto Sans CJK SC Regular" :size 16))
