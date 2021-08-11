(global-hl-line-mode t)

;;(set-face-font 'default (font-spec :family "JetBrains Mono" :size 16))
;;(set-fontset-font t 'han (font-spec :family "SourceHanSerifSC" :size 16))


(defalias 'set-face 'set-face-attribute)
(set-cursor-color "azure1")

(set-face 'default nil :foreground "gray85" :background "#000")
(set-face 'region nil :background "MediumPurple4")
(set-face 'underline nil :underline t)
(set-face 'minibuffer-prompt nil :foreground "burlywood2")

(set-face 'mode-line nil :foreground "#F8F8F2" :background "#000000")
(set-face 'mode-line-buffer-id nil :foreground nil :background "#000000")
(set-face 'mode-line-inactive nil :foreground "#BCBCBC" :background "#000000")
(set-face 'mode-line-highlight nil :foreground "#A3A3A3")


(set-face 'font-lock-builtin-face nil :foreground "goldenrod2")
(set-face 'font-lock-comment-face nil :foreground "DarkSeaGreen4")
(set-face 'font-lock-comment-delimiter-face nil :foreground "RosyBrown4")
(set-face 'font-lock-constant-face nil :foreground "burlywood2")
(set-face 'font-lock-doc-face nil :foreground "#6B8E23")
(set-face 'font-lock-function-name-face nil :foreground "yellow2")
(set-face 'font-lock-keyword-face nil :foreground "turquoise3")
(set-face 'font-lock-preprocessor-face nil :foreground "plum1")
(set-face 'font-lock-string-face nil :foreground "DarkOliveGreen3")
(set-face 'font-lock-type-face nil :foreground "PaleVioletRed1")
(set-face 'font-lock-variable-name-face nil :foreground "LemonChiffon3")
(set-face 'font-lock-warning-face nil :foreground "coral2")


(set-face 'internal-border nil :background "gray20")


(set-face 'company-preview-common nil :foreground "aquamarine" :background "turquoise4")
(set-face 'company-tooltip nil :foreground "gray80" :background "gray20")
(set-face 'company-tooltip-annotation nil)
(set-face 'company-tooltip-common nil :foreground "aquamarine")
(set-face 'company-tooltip-selection nil :foreground "aquamarine" :background "turquoise4" :box '(:line-width 3 :color "DarkSlateGray4" :style released-button))
(set-face 'company-tooltip-annotation-selection nil :foreground "aquamarine")
(set-face 'company-tooltip-annotation nil :foreground "gray60")
(set-face 'company-scrollbar-fg nil :background "#000")
(set-face 'company-scrollbar-bg nil :background "#1f1f1f")


(set-face 'frog-menu-action-keybinding-face nil :foreground "cyan3")
(set-face 'frog-menu-actions-face nil :foreground "cyan4")
(set-face 'frog-menu-candidates-face nil :foreground "LemonChiffon1" :box '(:line-width 3 :color "gray10" :style none))
(set-face 'frog-menu-posframe-background-face nil :background "gray10")
(set-face 'frog-menu-prompt-face nil :foreground "gray50" :background "gray10" :distant-foreground "black")


(set-face 'eldoc-highlight-function-argument nil
                    :underline t :foreground "burlywood2"
                    :weight 'bold)



(set-face 'ace-jump-face-background nil :foreground "gray50")
(set-face 'ace-jump-face-foreground nil :foreground "Orange" :underline nil)

(set-face 'avy-lead-face nil :foreground "orange red" :background "gray10" :box '(:line-width 3 :color "gray10" :style none))


(set-face 'tooltip  nil :foreground "OliveDrab1" :background "gray25" :box '(:line-width 3 :color "gray50" :style released-button))

(set-face 'which-func nil :foreground "burlywood2")
(set-face 'which-key-command-description-face nil :foreground "DarkSeaGreen2" :box '(:line-width 2 :color "black"))
(set-face 'which-key-group-description-face nil :foreground "DarkOrange")
(set-face 'which-key-key-face nil :foreground "gold2")

(set-face 'ivy-current-match nil :foreground "SpringGreen2"  :background "gray25")
;(set-face 'which-key-posframe nil :background "gray20")
;(set-face 'which-key-posframe-border nil :background "gray30")
                                        ;(setq which-key-posframe-border-width 6)

(set-face 'ivy-posframe nil :background "gray25" :foreground "cornsilk")


(set-face 'helm-action nil)
(set-face 'helm-candidate-number nil)
(set-face 'helm-header-line-left-margin nil)
(set-face 'helm-match nil :foreground "aquamarine3")
(set-face 'helm-M-x-key nil :foreground "cyan2")
(set-face 'helm-buffer-archive nil :foreground "orange2")
(set-face 'helm-buffer-directory nil :foreground "SeaGreen2")
(set-face 'helm-buffer-file nil :foreground "wheat1")
(set-face 'helm-buffer-modified nil :foreground "IndianRed2")
(set-face 'helm-buffer-not-saved nil :foreground "PaleVioletRed4")
(set-face 'helm-buffer-process nil :foreground "DarkSlateGray3")
(set-face 'helm-buffer-saved-out nil :background "black" :foreground "MediumOrchid1")
(set-face 'helm-buffer-size nil :foreground "burlywood3")
(set-face 'helm-delete-async-message nil :foreground "orange2")
(set-face 'helm-ff-denied nil :foreground "DeepPink2")
(set-face 'helm-ff-directory nil :foreground "SeaGreen4")
(set-face 'helm-ff-dirs nil :foreground "SeaGreen4")
(set-face 'helm-ff-dotted-directory nil :foreground "SlateGray3")
(set-face 'helm-ff-dotted-symlink-directory nil :foreground "LightGoldenrod2")
(set-face 'helm-ff-executable nil :foreground "SeaGreen2")
(set-face 'helm-ff-file nil :foreground "yellow")
(set-face 'helm-non-file-buffer nil :foreground "gray75")
(set-face 'helm-selection nil :background "DodgerBlue4" :foreground "turquoise1" :box '(:line-width 3 :color "SteelBlue4" :style released-button))
(set-face 'helm-source-header nil :background "gray20" :foreground "gray90" :height 1 :family "Sans Serif")


(set-face 'rainbow-delimiters-depth-1-face nil :foreground "#FF6A6A")
(set-face 'rainbow-delimiters-depth-2-face nil :foreground "#FF9900")
(set-face 'rainbow-delimiters-depth-3-face nil :foreground "#FFD700")
(set-face 'rainbow-delimiters-depth-4-face nil :foreground "#9ACD32")
(set-face 'rainbow-delimiters-depth-5-face nil :foreground "#20B2AA")
(set-face 'rainbow-delimiters-depth-6-face nil :foreground "#87CEEB")
(set-face 'rainbow-delimiters-depth-7-face nil :foreground "#1E90FF")
(set-face 'rainbow-delimiters-depth-8-face nil :foreground "#7B68EE")
(set-face 'rainbow-delimiters-depth-9-face nil :foreground "#BA55D3")
(set-face 'rainbow-delimiters-unmatched-face nil :foreground "#A9A9A9")

(set-face 'hl-line nil  :inherit nil :box '(:line-width 3 :color "DarkSlateGray4" :style released-button))

(set-face 'markdown-header-face-1 nil :foreground "red3" :height 1.0)
(set-face 'markdown-header-face-2 nil :foreground "orange2" :height 1.0)
(set-face 'markdown-header-face-3 nil :foreground "gold" :height 1.0)
(set-face 'markdown-header-face-4 nil :foreground "SpringGreen" :height 1.0)
(set-face 'markdown-header-face-5 nil :foreground "LightSkyBlue" :height 1.0)
(set-face 'markdown-header-face-6 nil :foreground "HotPink" :height 1.0)


(provide 'cumacs-theme)

