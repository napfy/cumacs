(setq-default line-spacing nil)
;(tooltip-mode +1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)

(which-function-mode)
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parentheses)


(cumacs-require-package 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-modeline-bar-width 3)

(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

(setq doom-modeline-icon (display-graphic-p))

(setq doom-modeline-major-mode-icon t)

(setq doom-modeline-major-mode-color-icon t)

(setq doom-modeline-buffer-state-icon t)

(setq doom-modeline-buffer-modification-icon t)

(setq doom-modeline-minor-modes (featurep 'minions))

(setq doom-modeline-buffer-encoding t)

(setq doom-modeline-checker-simple-format t)

(setq doom-modeline-vcs-max-length 12)

(setq doom-modeline-persp-name nil)

(setq doom-modeline-env-version t)

(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-rust t)

(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-rust-executable "rustc")


(setq doom-modeline-env-load-string "...")
;run M-x (all-the-icons-install-fonts)

(setq-default frame-title-format
      '(" CUMACS - " (:eval (if (buffer-file-name)
                                                    (abbreviate-file-name (buffer-file-name))
                                                 "%b"))))

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(transient-mark-mode t)
(setq lazy-lock-defer-on-scrolling t)
(setq font-lock-maximum-decoration t)
(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq display-time-24hr-format t)  
(setq display-time-day-and-date t)  

;;Chinese input method switch
(global-set-key (kbd "C-SPC") 'nil)
;(global-font-lock-mode t)
;;(auto-image-file-mode t)
;;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)

(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-S-o") 'previous-multiframe-window)
(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "<escape>") 'keyboard-quit)

(if (fboundp 'fringe-mode)
    (fringe-mode 4))


(setq desktop-path '("~/.emacs.d"))
(setq desktop-dirname "~/.emacs.d")
(setq desktop-base-file-name "cumacs-desktop")

(defun cumacs/session-saved-p ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

(defun cumacs/restore-session ()
  (if (cumacs/session-saved-p)
	  (desktop-read desktop-dirname)
	(message "Desktop not found.")))

(defun cumacs/save-session ()
  (desktop-save-in-desktop-dir)
  (message "Desktop saved."))


(add-hook 'after-init-hook
		  '(lambda ()
			 (if (cumacs/session-saved-p)
				 (cumacs/restore-session))))

(defvar desktop-modes-not-to-save nil)
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

(setq desktop-restore-eager 32)

(defun cumacs-save-and-exit ()
  (interactive)
  (cumacs/save-session)
  (save-buffers-kill-terminal))

(global-set-key (kbd "C-x C-c") 'cumacs-save-and-exit)

(auto-image-file-mode)
(defvar server-auth-dir "~/")
(setq server-name "cumacs-server")
(server-start)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(setq-default indent-tabs-mode nil)
(setq-default standard-indent 2)
(setq-default tab-width 2)


(require 'saveplace)
(setq-default save-place t)

(setq default-major-mode 'text-mode)


(setq scroll-margin 0 scroll-conservatively 10000 scroll-preserve-screen-position 1)
(setq x-select-enable-clipboard t)
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 3)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("" . "~/emacs/.backups")))


(define-prefix-command 'cumacs-hs-map)

(global-set-key (kbd "C-c h") 'cumacs-hs-map)
(global-set-key (kbd "C-c m") 'comment-or-uncomment-region)


(defun cumacs/hs-hook()
  (define-key cumacs-hs-map (kbd ",") 'hs-hide-all)
  (define-key cumacs-hs-map (kbd ".") 'hs-show-all)
  (define-key cumacs-hs-map (kbd "[") 'hs-hide-block)
  (define-key cumacs-hs-map (kbd "]") 'hs-show-block)
  (define-key cumacs-hs-map (kbd "l") 'hs-hide-level)
  (define-key cumacs-hs-map (kbd "h") 'hs-toggle-hiding))

(add-hook 'hs-minor-mode-hook 'cumacs/hs-hook)

(global-set-key (kbd "C-M-x") 'kill-buffer-and-window)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-TAB") nil)


(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers        
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line))

(defun cumacs-set-transparency (alpha-level)
  (interactive "p")
  (message (format "Alpha level passed in: %s" alpha-level))
  (let ((alpha-level (if (< alpha-level 2)
                         (read-number "Opacity percentage: " 85)
                       alpha-level))
        (myalpha (frame-parameter nil 'alpha)))
    (set-frame-parameter nil 'alpha alpha-level))
  (message (format "Alpha level is %d" (frame-parameter nil 'alpha))))

(recentf-mode 1)

(setq recentf-max-menu-items 30)
(setq recentf-max-saved-items 30)

(global-set-key (kbd "C-c r") 'grep-find)

(save-place-mode 1)
(global-auto-revert-mode t)
(setq dired-dwim-target t)
(setq global-auto-revert-non-file-buffers t)

(delete-selection-mode 1)

(global-set-key (kbd "C-z") 'nil)

(winner-mode 1)

(setq delete-by-moving-to-trash t)

(setq dired-recursive-deletes 'always)

(setq dired-recursive-copies 'always)

(setq visible-bell t)

(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)

(global-set-key (kbd "RET") 'cumacs-newline)

(provide 'cumacs-basic)
