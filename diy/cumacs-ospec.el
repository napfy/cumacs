(load-library 
 (cond
  ((eq system-type 'windows-nt) "cumacs-mingw-config")
  ((eq system-type 'darwin)  "cumacs-macos-config")
  (t  "cumacs-config")))

(provide 'cumacs-ospec)
