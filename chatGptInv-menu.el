;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;; Author: Mohsen BANAN --- 2023 --- Part Of Blee

(require 'easymenu)
(require 's)
(require 'bcf-general)

;; (b:chatGpt:menu:plugin|install modes:menu:global (s-- 3))
(defun b:chatGpt:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (b:chatGpt:menu:select|define :active t)
   <menuDelimiter
   )
  )

;;
;; [[elisp:(popup-menu (symbol-value (browsers:menu:help|define)))][This Menu]]
;; (popup-menu (symbol-value (b:chatGpt:menu:select|define)))
;;
(defun b:chatGpt:menu:select|define (&rest <namedArgs)
  "Provide for control of CHATGPT related parameters, Return b:chatGpt:menu:select menu.
:active and :visible can be specified as <namedArgs.
"
  (let (
	(<visible (get-arg <namedArgs :visible t))
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      b:chatGpt:menu:select
      nil
      "Global Menu For CHATGPT  related facilities."
      `("Global CHATGPT Menu"
	:help "Invoke ChatGpt Commands and Show And Set CHATGPT Related Parameters"
	:visible ,<visible
	:active ,<active
	,(s-- 3)
	,(s-- 4)
        [
	 "ChatGPT Prompt"
	 (call-interactively 'chatgpt-prompt)
         :help "Query OpenAI with PROMPT calling the CALLBACK function on the resulting buffer."
	 :active t
	 :visible t
	 ]

	 [
	  "ChatGPT Explain Region"
	  (call-interactively 'chatgpt-explain-region)
	  :help "asks ChatGPT to explain whats wrong with Region."
	  :active t
	  :visible t
	  ]
	 ,(s-- 7)
	 ,(s-- 8)
	 ))

    (easy-menu-add-item
     b:chatGpt:menu:select
     nil
     (bx:menu:panelAndHelp|define
      "/bisos/git/auth/bxRepos/blee-binders/bisos-core/sync/_nodeBase_"
      $thisFuncName
      (intern (symbol-name (gensym))))
     (s-- 8))
    'b:chatGpt:menu:select
    ))


(provide 'chatGpt-menu)
