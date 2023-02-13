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
	  "ChatGPT Rewrite Region (text)"
	  (call-interactively 'chatgpt-rewrite-region)
	  :help "asks ChatGPT to rewrite the region."
	  :active t
	  :visible t
	  ]
	 [
	  "ChatGPT Fix Region (code)"
	  (call-interactively 'chatgpt-fix-region)
	  :help "asks ChatGPT to explain whats wrong with region."
	  :active t
	  :visible t
	  ]
	 [
	  "ChatGPT Explain Region (code)"
	  (call-interactively 'chatgpt-explain-region)
	  :help "asks ChatGPT to explain what it does."
	  :active t
	  :visible t
	  ]
	 [
	  "ChatGPT Tests For Region (code)"
	  (call-interactively 'chatgpt-gen-tests-for-region)
	  :help "asks ChatGPT to to write tests for region."
	  :active t
	  :visible t
	  ]
	 [
	  "ChatGPT Refactor Region (code)"
	  (call-interactively 'chatgpt-refactor-region)
	  :help "asks ChatGPT to refactor region."
	  :active t
	  :visible t
	  ]
	 [
	  "ChatGPT Prompt Region (Any)"
	  (call-interactively 'chatgpt-prompt-region)
	  :help "asks ChatGPT to prompt region."
	  :active t
	  :visible t
	  ]
	 [
	  "ChatGPT Prompt Region And Replace (Any)"
	  (call-interactively 'chatgpt-prompt-region-and-replace)
	  :help "Replace region with the response from the ChatGPT."
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
      "/bisos/git/auth/bxRepos/blee-binders/non-libre-halaal/ChatGPT/_nodeBase_"
      $thisFuncName
      nil)
     (s-- 7))
    'b:chatGpt:menu:select
    ))


(provide 'chatGptInv-menu)
