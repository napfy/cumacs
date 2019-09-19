(setq package-enable-at-startup nil)
(defvar package-pinned-packages nil)
(defvar package-archives
  ;; '(("gnu" . "https://elpa.gnu.org/packages/")
  ;; 	("marmalade" . "https://marmalade-repo.org/packages/")
  ;; 	("melpa-stable" . "https://stable.melpa.org/packages/")
  ;; 	("melpa" . "https://melpa.org/packages/"))
  '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
    ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(defvar cumacs-dir (file-name-directory load-file-name))
(defvar package-user-dir (expand-file-name "repo" (file-name-directory (directory-file-name cumacs-dir))))

(setq warning-minimum-level :error)

(let ((dirlist (list cumacs-dir (expand-file-name "base" cumacs-dir) (expand-file-name "os" cumacs-dir) (expand-file-name "dev" cumacs-dir) (expand-file-name "elisp" cumacs-dir) (expand-file-name "repo" (file-name-directory (directory-file-name cumacs-dir))))))
(dolist (cudir dirlist)
    (add-to-list 'load-path cudir)))

(let ((pkg-dir (expand-file-name "elisp" cumacs-dir)))
  (dolist (fd (directory-files pkg-dir))
	(if (and (not (eq "." fd)) (not (eq ".." fd)) (file-directory-p (concat pkg-dir "/" fd)))
	    (add-to-list 'load-path (concat pkg-dir "/" fd)))))

(package-initialize)
(require 'cumacs-common)
(require 'cumacs-util)
(require 'cumacs-basic)
(require 'cumacs-os)
(require 'async)
(async-bytecomp-package-mode 1)
(require 'cumacs-dev)
(require 'cumacs-theme)
