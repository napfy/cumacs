(load "term/xterm")
(defun terminal-init-fbterm ()
  (unless (terminal-coding-system)
	(set-terminal-coding-system 'utf-8-unix))
  (tty-no-underline)
  (ignore-errors (when gpm-mouse-mode (require 't-mouse) (gpm-mouse-enable)))
  (xterm-register-default-colors))
(provide 'term/fbterm)
