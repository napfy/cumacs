(require 'cumacs-yasnippet)
(require 'cumacs-company)
;(push 'company-yasnippet company-backends)
;(global-set-key (kbd "C-c y") 'company-yasnippet)
(global-font-lock-mode t)
(cumacs-require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)


(cumacs-require-package 'restclient)

(cumacs-require-package 'dumb-jump)
(cumacs-require-package 'magit)

(require 'cumacs-lang-javascript)
(require 'cumacs-lang-typescript)
(require 'cumacs-lang-elisp)

;(cumacs-require-package 'psvn)
(require 'cumacs-lang-rust)
;(require 'cumacs-lang-go)
(require 'cumacs-web-mode)
;(require 'cumacs-lang-clojure)
(require 'cumacs-editor)
(require 'cumacs-docker)
(require 'cumacs-rest)
(provide 'cumacs-dev-index)
