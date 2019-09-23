(require 'scim-bridge)
(add-hook 'after-init-hook 'scim-mode-on)
(scim-define-common-key (kbd "C-SPC") t)
(scim-define-common-key (kbd "C-/") nil)
(setq scim-cursor-color '("lightgreen" "gold" "white"))

