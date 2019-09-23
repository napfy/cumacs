(load-library 
 (cond
  ((eq system-type 'windows-nt) "cumacs-os-mingw")
  ((eq system-type 'darwin)  "cumacs-os-mac")
  (t  "cumacs-os-linux")))

(provide 'cumacs-os)
