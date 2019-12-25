;;; package --- cumacs-common
;;; Commentary:
(defun cumacs-replace-buffer-string(schstr repstr)
  (save-excursion)
  (goto-char 0)
  (search-forward schstr nil t)
  (backward-char (length schstr))
  (delete-char (length schstr))
  (insert repstr))

(defun cumacs-fix-windows-linebreak()
  (interactive)
  (save-excursion)
  (goto-char 0)
  (while (search-forward "" nil t)
    (cumacs-replace-buffer-string  "" "")))

;检查当前行是否有分号
;检查下行是否有空行

(defun cumacs-newline ()
  (interactive)
  (progn
    (newline)    
    (newline)
    (indent-for-tab-command)
    (previous-line)
    (indent-for-tab-command)))

(defun cumacs-newline-no-indent ()
  (interactive)
  (newline)
  (beginning-of-line))

(require 'package)
(defvar cumacs-refresh-package nil)

(defun cumacs-require-package (pkg-name)
  (if (package-installed-p pkg-name)
      (require pkg-name)
      (progn
		(unless cumacs-refresh-package
		  (progn
			(package-refresh-contents)
			(setq cumacs-refresh-package 1)))
		(package-install pkg-name)
		(require pkg-name))))

(defun cumacs-use-package (pkg-name)
  (if (not (package-installed-p pkg-name))
      (progn
		(unless cumacs-refresh-package
		  (progn
			(package-refresh-contents)
			(setq cumacs-refresh-package 1)))
		(package-install pkg-name))))


(defvar cumacs-http-proxy-address "")
(defun cumacs-use-proxy ()
  (interactive)
  (setq cumacs-http-proxy-address (read-string  "proxy: "))
  (when (not (string-equal cumacs-http-proxy-address ""))
    (message (concat "use proxy:" cumacs-http-proxy-address))
    (setq url-using-proxy t)
    (setq url-proxy-services  `(("http" . ,cumacs-http-proxy-address)))))

(provide 'cumacs-common)
;;; cumacs-common ends here
