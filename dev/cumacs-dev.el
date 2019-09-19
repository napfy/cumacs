(require 'cumacs-yasnippet)
(require 'cumacs-company)

(global-font-lock-mode t)
(cumacs-require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)


(cumacs-require-package 'restclient)

(cumacs-require-package 'dumb-jump)
(cumacs-require-package 'magit)

(require 'cumacs-lang-javascript)
(require 'cumacs-lang-typescript)
(require 'cumacs-lang-elisp)

(require 'cumacs-lang-rust)
(require 'cumacs-web-mode)
(require 'cumacs-docker)
(require 'cumacs-rest)
(require 'cumacs-editor)
(provide 'cumacs-dev)
