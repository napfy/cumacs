(setq package-enable-at-startup nil)
(defvar package-pinned-packages nil)
(setq package-archives
  ;; '(("gnu" . "https://elpa.gnu.org/packages/")
  ;; 	("melpa" . "https://melpa.org/packages/"))
  '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
    ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(defvar cumacs-dir (file-name-directory load-file-name))
(defvar package-user-dir (expand-file-name "repo" (file-name-directory (directory-file-name cumacs-dir))))

(setq warning-minimum-level :error)

(let ((dirlist (list cumacs-dir (expand-file-name "base" cumacs-dir) (expand-file-name "os" cumacs-dir) (expand-file-name "dev" cumacs-dir) (expand-file-name "elisp" cumacs-dir) (expand-file-name "repo" (file-name-directory (directory-file-name cumacs-dir))))))
(dolist (cudir dirlist)
    (add-to-list 'load-path cudir)))

(package-initialize)
(require 'cumacs-common)
(require 'cumacs-util)
(require 'cumacs-shortcut)
(require 'cumacs-basic)
(require 'cumacs-os)
(require 'async)
(async-bytecomp-package-mode 1)
(require 'cumacs-dev)
(require 'cumacs-theme)
