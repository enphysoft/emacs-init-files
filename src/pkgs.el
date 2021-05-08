

;; (wrap-region-global-mode t) (wrap-region-add-wrappers '(
;; ("'" "'" "!")
;; ("@" " " "@")
;; ("/* " " */" "#")
;; ("$" "$")
;; ("``" "''" "%")
;; ("/" "/" "?") ;; Shift+/
;; ;;
;; ("[" "]" "}")
;; ("{" "}" "{")
;; ;;
;; ("<" ">" "<")
;; ("<<" ">>" ">")
;; ;;
;; ("'" "'" "'")
;; ("*" "*")
;; ("|" "|")
;; ("~" "~" "~")
;; ("&" "&" "&")
;; ("+" "+" "+")
;; ("_" "_" "_")
;; )) 



;; (require 'openwith)
;; (when (require 'openwith nil 'noerror)
;;       (setq openwith-associations
;;             (list
;;              (list (openwith-make-extension-regexp
;;                     '("mpg" "mpeg" "mp3" "mp4" "avi" "wmv"
;; 		      "wav" "mov" "flv" "ogm" "ogg" "mkv"))
;; 		   "vlc"
;; 		   '(file))
;;              (list (openwith-make-extension-regexp
;; 		    '("doc" "xls" "xlsx" "ppt" "odt" "ods"
;; 		      "odg" "odp"))
;; 		   "libreoffice"
;; 		   '(file))
;;              (list (openwith-make-extension-regexp
;;                     '("pdf" "ps" "ps.gz" "dvi"))
;;                    "okular"
;;                    '(file))
;;              '("\\.chm"         "kchmviewer"            (file))
;;              '("\\.planner\\'"  "planner"               (file))
;;              '("\\.gan\\'"      "ganttproject"          (file))
;;              '("\\.kmy\\'"      "kmymoney"              (file))
;;              '("\\.lyx\\'"      "lyx"                   (file))
;;              '("\\.png\\'"      "gwenview"              (file))
;;              '("\\.docx\\'"     "libreoffice"           (file))
;;              '("\\.html\\'"     "chromium-browser"	(file))
;;              ;; '("\\.html\\'"     "firefox"               (file))
;;              '("\\.mppz\\'"     "/usr/bin/java -Xmx1000m -jar ~/usr/bin/MagicPlotPro.jar" (file))
;;              '("\\.xmind\\'"    "/home/albertsk/usr/bin/XMind_64"     (file))
;;              ))
;;       (openwith-mode t))
;; ;;

;;
;; (yas-global-mode 1)
;; ;; to get rid of warning messages
;; (unless (boundp 'warning-suppress-types)
;;   (setq warning-suppress-types nil))
;; (push '(yasnippet backquote-change) warning-suppress-types)

;; ;;
;;

;; 
;; ===============================================================================
;;Package helm-bibtex is installed.
;;     Status: Installed in ‘helm-bibtex-20201214.2111/’ (unsigned). Delete
;;    Version: 20201214.2111
;;     Commit: 94807a3d3419f90b505eddc3272e244475eeb4f2
;;    Summary: A bibliography manager based on Helm
;;   Requires: bibtex-completion-1.0.0, helm-1.5.5, cl-lib-0.5, emacs-24.1
;;   Homepage: https://github.com/tmalsburg/helm-bibtex
;; Maintainer: Titus von der Malsburg <malsburg@posteo.de>
;;     Author: Titus von der Malsburg <malsburg@posteo.de>
;;Other versions: 20201214.2111 (melpa).
;;
;; (autoload 'helm-bibtex "helm-bibtex" "" t)

;; (setq bibtex-completion-bibliography
;;       '("/home/albertsk/usr/lib/zotero.bib"        ;; "/path/to/bibtex-file-2.bib"
;; ))

;; (setq org-latex-pdf-process
;;         '("pdflatex -interaction nonstopmode -output-directory %o %f"
;;           "bibtex %b"
;;           "pdflatex -interaction nonstopmode -output-directory %o %f"
;;           "pdflatex -interaction nonstopmode -output-directory %o %f"))
;; ===============================================================================


;; ;; to directly go to the projectile dired directories
;; (global-set-key (kbd "s-i c") 'flyspell-correct-word-before-point) ;; to select a correct word from sel.
;; (global-set-key (kbd "C-x p") 'helm-projectile-switch-project)
;; (global-set-key (kbd "C-x /") 'ibuffer-sidebar-toggle-sidebar)
;; (global-set-key (kbd "M-a") 'beginning-of-line)
;; (global-set-key (kbd "M-e") 'end-of-line)

;;
;;
;;

;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)



;;Package fancy-dabbrev is installed.
;; (setq abbrev-file-name "~/.emacs.d/abrv.el") ; /home/albertsk/.emacs.d/abrv.el
;; (setq save-abbrevs 'silent)	;; save abbrevs when files are saved
;; (setq-default abbrev-mode t)	;; turn on abbrev mode globally

;; (defun my-after-abbrev-expand ()
;;   (when (looking-back "\"\"\\|''\\|()\\|\\[\\]\\|{}")
;;     (backward-char 1))  t)
;; (put 'my-after-abbrev-expand 'no-self-insert t)

;; ==============================================;; ==================================
;; ;; Package ace-window is installed.
;; (global-set-key (kbd "M-o") 'ace-window)
;; (setq aw-keys '(?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))

;; ================
;; ox-extra
;; ================

(require 'ox-extra)   ;; this package is NOT for (use-package)
(ox-extras-activate '(ignore-headlines))

(use-package ac-helm
  :init
  :config
  (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
)

(global-set-key (kbd "C-:") 'ac-complete-with-helm)



(use-package hl-sentence
  ;; :init
  ;; (setq foo-variable t)
  ;; :config
  ;; (foo-mode 1)
)

(use-package helm-fuzzy-find)

;; ==================================================================================
;; Package buffer-move is available obsolete.
;; define some keybindings. For example, i use :
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-s-left>")   'buf-move-left)
(global-set-key (kbd "<C-s-right>")  'buf-move-right)

;; Package which-key is available.
(require 'which-key)
(which-key-mode)
(setq which-key-idle-delay 0.1)
(setq which-key-max-display-columns nil)
;; select one of three below
(which-key-setup-side-window-bottom)
;; (which-key-setup-side-window-right)
;; (which-key-setup-side-window-right-bottom)
;; (setq which-key-side-window-max-width 0.5)
;; (setq which-key-popup-type 'frame)
(setq which-key-frame-max-width 96)
(setq which-key-max-description-length 64)


(add-to-list 'load-path "~/.emacs.d/extra/emacs-libvterm/")
(require 'vterm)
(add-to-list 'load-path "~/.emacs.d/extra/multi-vterm-master/")
(require 'multi-vterm)
