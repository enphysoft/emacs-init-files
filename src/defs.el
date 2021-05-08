;; ask-defs-autoloads.el
;; /home/albertsk/.emacs.d/ask-defs.el

;; This is to change mode line
(set-face-attribute 'mode-line-buffer-id nil :foreground "DodgerBlue4" :height 1.2)

;; 
(defun ask-org-insert-square-bracket ( ) 
  "Description: to simply include an empty squared bracket [ ] as an org-item
after change whichever xah-fly-keys mode to (xah-fly-insert-mode-activate).
01/27/2021 " 
(interactive)
(xah-fly-insert-mode-activate)
(insert "[ ] "))
;; 
(global-set-key (kbd "M-[") 'ask-org-insert-square-bracket)
  
;; global-set-key
;; ================================================================================
;; keys 
;; ================================================================================
;; to open menu bar using keyboard 
(global-set-key (kbd "s-z") 'org-comment-dwim-2) ;
(customize-set-value 'org-latex-with-hyperref nil)
(global-set-key (kbd "s-y") 'menu-bar-open)
;; 
(define-key global-map "\C-cc" 'org-capture)
;;
(global-set-key (kbd "s-<delete>") 'xah-delete-backward-bracket-pair) 
(global-set-key (kbd "C-/") "$$ ")
(global-set-key (kbd "<menu>") 'tab-to-tab-stop)
(global-set-key (kbd "<mouse-3>") 'newline)
(global-set-key (kbd "C-j") 'eval-print-last-sexp)
(global-set-key (kbd "C-c d") 'combine-characters-w-dash)
(global-set-key (kbd "C-c w") 'combine-characters)
(global-set-key (kbd "C-s-k") 'top-join-line)  ;; [2018-12-30-22-03-21-PM] 
;; (global-set-key (kbd "C-s-l") 'org-metaright)
;; (global-set-key (kbd "C-s-j") 'org-metaleft) 
(global-set-key (kbd "C-f") 'org-metaright)
(global-set-key (kbd "C-b") 'org-metaleft)
;; 
(global-set-key (kbd "M-f") 'org-metaright)	;; test 02/15/2021 07:20:13 AM
(global-set-key (kbd "M-b") 'org-metaleft) 	;; test 02/15/2021 07:20:13 AM

(global-set-key (kbd "C-s-i") 'org-metaup)
(global-set-key (kbd "C-s-,") 'org-metadown)

(global-set-key (kbd "M-s-k") 'top-join-multiple-lines)
;; (global-set-key (kbd "M-f") 'ido-find-file) ;; use "C-o" instead M-f is used to scrolling with M-v. 
(global-set-key [s-f1]    #'menu-bar-open)
;; (global-set-key (kbd "s-b") 'xah-new-empty-buffer)
;; (global-set-key (kbd "s-f") 'make-frame)

(global-set-key (kbd "s-o") 'ace-window)
(global-set-key (kbd "s-r") 'retindent)
(global-set-key (kbd "s-t") 'transpose-mark-region)
(global-set-key (kbd "s-w") 'forward-word-one-char)
;; 
(global-set-key (kbd "s-i a") 'ask-org-agenda-log-mode)
(global-set-key (kbd "s-i f") 'xah-find-text)
(global-set-key (kbd "s-i g") 'import-backward-sentence-to-other-window) 
(global-set-key (kbd "s-i m") 'compose-thunderbird-mail)
(global-set-key (kbd "s-i n") 'lunaryorn-new-buffer-frame)
(global-set-key (kbd "s-i q") 'quote-lines)
(global-set-key (kbd "s-i r") 'remove-parens)
(global-set-key (kbd "s-i t") 'org-item-todo)
(global-set-key (kbd "s-i w") 'org-item-waiting)
(global-set-key (kbd "s-i x") 'org-item-done)
;; 
(global-set-key (kbd "s-i s-b") 'ask/replace/curly-to-rect-bra)
(global-set-key (kbd "s-i s-c") 'flyspell-correct-word-before-point)
(global-set-key (kbd "s-i s-d") 'ask-org-remove-olist) ;; [2020-06-07-06-48-31-AM]
;; 
(global-set-key (kbd "s-i s-i") 'ask-org-make-olist)
(global-set-key (kbd "s-i s-n") 'ask-org-make-nlist)
(global-set-key (kbd "s-i s-t") 'ask-insert-date-time) ;; [2019-01-06-12-24-02-PM] 
(global-set-key (kbd "s-i s-g") 'wrap/text/region)
;; 
(global-set-key (kbd "C-x C-<up>") 'tab-bar-switch-to-next-tab) ;; 2020-10-18-22-31-49-PM
(global-set-key (kbd "C-x C-<down>") 'tab-bar-switch-to-prev-tab);; 2020-10-18-22-31-51-PM
;; right middle row of keyboard
(global-set-key (kbd "s-h") "!")
(global-set-key (kbd "s-j") "@")
(global-set-key (kbd "s-k") 'delete-forward-char)
;;(global-set-key (kbd "s-l") "$$ ")
;;(global-set-key (kbd "s-;") "~")
;;(global-set-key (kbd "s-'") "|")
;; bottom middle row of keyboard
;;(global-set-key (kbd "s-n") "^")
;;(global-set-key (kbd "s-m") "-")
;;(global-set-key (kbd "s-,") "_")
(global-set-key (kbd "s-,") 'xah-prev-window-or-frame)

;;(global-set-key (kbd "s-.") "=")
;;(global-set-key (kbd "s-/") "\\") 
;; the similar keyboard set 
(global-set-key (kbd "C-?") "!")
;; link related 
(global-set-key (kbd "s-i ]") 'ask-make-link)
(global-set-key (kbd "s-i l") 'ask-make-link)

(global-set-key (kbd "M-]") "[ [ ][ ] ] ")
;;
(global-set-key (kbd "s-3") 'ask-insert-3space)
(global-set-key (kbd "s-i k") 'ask-line-code-column-align)
(global-set-key (kbd "s-i s") 'ask-region-code-column-align)
;; 
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'shrink-window)
(global-set-key (kbd "C-<up>") 'enlarge-window)
;; 
(global-set-key (kbd "<f8>") 'save-buffer-xah-fly-command-mode-activate-no-hook)
(global-set-key (kbd "s-<return>") 'org-meta-return-checkmark)
(global-set-key (kbd "C-c n") 'omns)
(global-set-key (kbd "C-c p") 'omps)
(global-set-key (kbd "s-i ;") 'cpp-new-line-n-indent)
(global-set-key (kbd "s-i d") 'ask-insert-diary-date)
(global-set-key (kbd "s-i 3") 'ask-insert-3space)
(global-set-key (kbd "s-i 6") 'ask-insert-6space)
(global-set-key (kbd "M-e") 'insert-symbol-equal)
(global-set-key (kbd "M-p") 'insert-symbol-plus)
(global-set-key (kbd "M-m") 'insert-symbol-minus)
(global-set-key (kbd "s-u") 'ask-upcase-word-backward)
(global-set-key (kbd "s-c") 'ask-cap-word-backward)
(global-set-key (kbd "s-l") 'ask-downcase-word-backward)
;;
(global-set-key [mouse-9] 'org-meta-return)	;; thumb inward 
(global-set-key [mouse-8] 'join-line)		;; thumb outward

;; (global-set-key (kbd "<insert>") 'ask/add-check-bracket)
;; (global-set-key (kbd "M-<insert>") 'org-meta-return)  ;; after CapsLock is assigned to "Insert"
(global-set-key (kbd "M-<insert>") 'ask/add-check-bracket)
(global-set-key (kbd "<insert>") 'org-meta-return)  ;; after CapsLock is assigned to "Insert"

;; =============================================================  

;; =========
;; Skeleton
;; =========
;; 
;; LaTex
;; (define-skeleton w/bsym "/" "/" "/boldsymbol{")
;; 
;; === 
;; Casual Writing
;; (define-skeleton .as-i-told-you-sometime-before        "/" "/" "As I told you sometime before ")
;; (define-skeleton .hagd			"/" "/" "Have a great day! ")
;; (define-skeleton .have-a-great-day	"/" "/" "Have a great day! ")
;; (define-skeleton .hru			"/" "/" "How are you? ")
;; (define-skeleton .hi-how-are-you	"/" "/" "How are you? ")
;; (define-skeleton .wrt			"/" "/" "with respect to ")
;; (define-skeleton .with-respect-to	"/" "/" "with respect to ")
;; (define-skeleton .2tbof			"/" "/" "to the best of my knowledge")
;; (define-skeleton .to-the-best-of	"/" "/" "to the best of my knowledge")
;; (define-skeleton .moldyn		"/" "/"	"molecular dynamics " )
;; (define-skeleton .molecular-dynamics    "/" "/"	"molecular dynamics " )
;; (define-skeleton .tku			"/" "/"	"thank you so much " )
;; (define-skeleton .thank-you-so-much	"/" "/"	"thank you so much " )
;; (define-skeleton .cee        "/" "/"	"the Department of Civil and Environmental Engineering " )
;; (define-skeleton .uhm        "/" "/"	"the University of Hawaii at Manoa " )
;; (define-skeleton .hru		"/" "/"	"How are you? " )
;; (define-skeleton .how-are-you	"/" "/"	"How are you? " )
;; (define-skeleton .thku			"/" "/"	"Thank you so much! " )
;; (define-skeleton .thank-you-so-much     "/" "/"	"Thank you so much! " )
;; (define-skeleton .engr       "/" "/"	"engineering " )
;; (define-skeleton .OF         "/" "/"	"OpenFOAM " )
;; (define-skeleton .hdr        "/" "/"	"hydrodynamic " )
;; (define-skeleton .env        "/" "/"	"environmental " )
;; (define-skeleton .dl         "/" "/"	"download " )
;; (define-skeleton .rw         "/" "/"	"review " )
;; === 
;;  FORTRAN90  
;; (setq skeleton-end-newline  nil)
;; (define-skeleton f/prgm "/" "/" "program myProgram \n\nend program  ")
;; (define-skeleton f/imnn "/" "/" "implicit none\n   integer, parameter :: rkind=8, ikind=4, ckind=1, lchar=256 \n   character(kind=ckind, len=lchar) :: cc \n   integer  (kind=ikind) :: ii \n   real     (kind=rkind) :: rr \n")
;; (define-skeleton f/chr  "/" "/" "character (kind=ckind, len=len256) :: mychar ")
;; (define-skeleton f/int  "/" "/" "integer   (kind=ikind) :: myIntVar  ")
;; (define-skeleton f/rel  "/" "/" "real      (kind=rkind) :: myRealVar ")
;; (define-skeleton f/rsp  "/" "/" "real(SP) :: mySPvar ")
;; (define-skeleton f/rdp  "/" "/" "real(DP) :: myDPvar ")
;; (define-skeleton f/lgc  "/" "/" "logical  :: myMessage = .true. ! .false. ")
;; (define-skeleton f/typ  "/" "/" "type      (myOwnDataType) :: myTypeVar ")
;; 
;; (define-skeleton f/abl  "/" "/" ", allocatable   ")
;; (define-skeleton f/dim  "/" "/" ", dimension (:) ")
;; (define-skeleton f/ext  "/" "/" ", external ")
;; (define-skeleton f/ino  "/" "/" ", intent (inout)")
;; (define-skeleton f/tgt  "/" "/" ", target ")
;; (define-skeleton f/ptr  "/" "/" ", pointer ")
;; 
;; (define-skeleton f/aloc "/" "/" "allocate  ( ) ")
;; (define-skeleton f/dloc "/" "/" "deallocate( ) ")
;; 
;; (define-skeleton f/rd   "/" "/" "read(unit= ,*) myVar")
;; (define-skeleton f/rw   "/" "/" "rewind(unit= ,iostat=icode, err=911)")
;; (define-skeleton f/prm  "/" "/" "parameter")
;; (define-skeleton f/nml  "/" "/" "namelist /nList/ var1, var2, var3 ")
;; 
;; (define-skeleton f/prm  "/" "/" "parameter")
;; (define-skeleton f/prn  "/" "/" "print *, myVar")
;; (define-skeleton f/wrs  "/" "/" "write(*,\"(G)\") ")
;; (define-skeleton f/wrt  "/" "/" "write(*,\"(' ,  = ', 1(I6,2X), 3(F16.8))\") ")
;; 
;; (define-skeleton f/open "/" "/" "open (unit= ,file= ,status=\"new,old,replace\")\n   close(unit= ) ")
;; (define-skeleton f/do   "/" "/" "loop_title:do i = 1, nmax \n\n   end do  ")
;; (define-skeleton f/dow  "/" "/" "loop_title:do while ($cond$) \n\n   end do  ")
;; (define-skeleton f/sel  "/" "/" "select case (selector) \ncase (label_1) \n   stat1 \ncase (label_2) \n   stat2 \nend select")
;; (define-skeleton f/if   "/" "/" "if ( a > b )  then \nelse if ( b == then \nelse \nend if ")
;; 
;; (define-skeleton f/mod  "/" "/" "module myModule \n\ncontains \n\nend module")
;; (define-skeleton f/pub  "/" "/" "public  :: ")
;; (define-skeleton f/prv  "/" "/" "private :: ")
;; (define-skeleton f/itf  "/" "/" "interface operator()\n   module procedure func_name \nend interface\n")
;; 
;; (define-skeleton f/ifun "/" "/" "integer   function ifun () result (ivar) \n   implicit none \nend function ")
;; (define-skeleton f/ffun "/" "/" "real*16   function dfun () result (rvar) \n   implicit none \nend function ")
;; (define-skeleton f/lfun "/" "/" "logical   function lfun () result (lvar) \n   implicit none \nend function ")
;; (define-skeleton f/rfun "/" "/" "recursive function rfun () result (rvar) \n   implicit none \nend function ")
;; (define-skeleton f/pfun "/" "/" "pure      function rfun () result (rvar) \n   implicit none \nend function ")
;; (define-skeleton f/sub  "/" "/" "subroutine mySubroutine (var_in, var_out)\n   implicit none\n   return \nend subroutine")
;; 
;; (define-skeleton f/tal  "/" "/" "trim(adjustl())")

(defun ask/capitalize-word-backward ( ) "Description: capitalize-word-backward"
       (interactive)
       (backward-word)
       (forward-word)
       (xah-fly-command-mode-activate-no-hook)
       (xah-toggle-letter-case)
       ;(forward-word)
       ;(insert " ")
       ;(xah-fly-insert-mode-activate)
)
;; 
(global-set-key (kbd "<f7>") 'ask/capitalize-word-backward)
;; 
(global-set-key (kbd "<f9> 1") "!")
(global-set-key (kbd "<f9> 2") "@")
(global-set-key (kbd "<f9> 3") "#")
(global-set-key (kbd "<f9> 4") "$")
(global-set-key (kbd "<f9> 5") "%")
(global-set-key (kbd "<f9> 6") "^")
(global-set-key (kbd "<f9> 7") "&")
(global-set-key (kbd "<f9> 8") "*")
(global-set-key (kbd "<f9> 9") "(")
(global-set-key (kbd "<f9> 0") ")")

(global-set-key (kbd "<f1> 1") "!")
(global-set-key (kbd "<f1> 2") "@")
(global-set-key (kbd "<f1> 3") "#")
(global-set-key (kbd "<f1> 4") "$")
(global-set-key (kbd "<f1> 5") "%")
(global-set-key (kbd "<f1> 6") "^")
(global-set-key (kbd "<f1> 7") "&")
(global-set-key (kbd "<f1> 8") "*")
(global-set-key (kbd "<f1> 9") "(")
(global-set-key (kbd "<f1> 0") ")")
;;
;; ask/insert-colon
(global-set-key (kbd "<f1> ;") `ask/insert-colon) ;; 02/15/2021 06:33:03 AM
(global-set-key (kbd "<f1> /") "?") ;; 02/15/2021 06:33:03 AM
(global-set-key (kbd "<f1> `") "~") ;; 02/15/2021 06:33:03 AM
(global-set-key (kbd "<f1> -") "_") ;;
(global-set-key (kbd "<f1> =") "+") ;;
(global-set-key (kbd "<f1> [") "{") ;;
(global-set-key (kbd "<f1> ]") "}") ;;
(global-set-key (kbd "<f1> \\") "|") ;;

;; 
(defun init-student-profile ()
  "Description: to initialize a student profile "
  (interactive)
  (let (word) 
    (setq word (if (use-region-p)
                   (buffer-substring-no-properties (region-beginning) (region-end))
                   (current-word)) )
    (beginning-of-line)
    (insert "** " word)
    (setq lastname  (replace-regexp-in-string ",.*" " " word))
    (setq firstname (replace-regexp-in-string ".*,[ ]+*" " " word))
    (setq middlename (replace-regexp-in-string " [a-zA-Z]* " " " firstname))
    (setq firstname (replace-regexp-in-string middlename " " firstname))
    ;; 
    (setq word (replace-regexp-in-string "," " " word))
    (setq word (replace-regexp-in-string "[ ] *" " " word))
    (setq word (replace-regexp-in-string " " "." word))
    (setq word (downcase word))
    ;; 
    (insert "\n:PROPERTIES: ")
    (insert "\n:DATE_INIT: " ) ;; insert time here later 
    (insert "\n:DATE_LAST: " )
    (insert "\n:ID: " word)
    (insert "\n:FOLDER: file:" word)
    (insert "\n:LASTNAME: " lastname)
    (insert "\n:FIRSTNAME: " firstname)
    (insert "\n:MIDDELNAME: " middlename)
    (insert "\n:UHID: ")
    (insert "\n:UHEMAIL: ")
    (insert "\n:EMAIL: ")
    (insert "\n:BIRTHDAY: ")
    (insert "\n:INTERNET: ")
    (insert "\n:RESEARCH: ")
    (insert "\n:ADVISOR: ")
    (insert "\n:DEGREE1: ")
    (insert "\n:APPLICATION: ")
    (insert "\n:APPLICATION: ")
    (insert "\n:STATEMENT: ")
    (insert "\n:TOEFL: ")
    (insert "\n:GRE: ")
    (insert "\n:FE: ")
    (insert "\n:GD_FORM: ")
    (insert "\n:THESIS: ")
    (insert "\n:DEGREE2: ")
    (insert "\n:QUAL_EXAM: ")
    (insert "\n:COMP_EXAM: ")
    (insert "\n:PRESENTATION: ")
    (insert "\n:PUBLICATION: ")
    (insert "\n:DISSERTATION: ")
    (insert "\n:FORMS: ")
    (insert "\n:HOME_ADDR: ")
    (insert "\n:WORK_ADDR: ")
    (insert "\n:WORK_PHONE: ")
    (insert "\n:CELL_PHONE: ")
    (insert "\n:HOME_PHONE: ")
    (insert "\n:SPOUSE: ")
    (insert "\n:CHILD1: ")
    (insert "\n:CHILD2: ")
    (insert "\n:CHILD3: ")
    (insert "\n:NOTE1: ")
    (insert "\n:END:\n ")
    (newline)
    (insert "*** communications \n- [ ] ")
))

(defalias 'isp  'init-student-profile)
(defalias 'init-spro  'init-student-profile)


(defun ask/insert/work-sections-in-journal ( )
  "Description: this simple function is to insert work items in journal files:
teaching, reseach, services, meetings, and computer.
02/13/2021 03:36:11 AM "
       (interactive)
       (insert "**** teaching\n")
       (insert "***** CEE696\n")
       
       (insert "**** research\n")
       (insert "***** Proposals\n")
       
       (insert "**** services\n")
       (insert "***** GD\n")
       
       (insert "**** meetings\n")
       (insert "**** computer\n")
       (insert "***** Emacs \n")
)

;;
;; (provide 'ask-defs)
