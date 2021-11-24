;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name    "Bruno Bonatto"
      user-mail-address "bfbonatto@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq! org-directory "~/org/")
(add-hook! org-mode
  (setq! org-latex-listings 'minted)
  (add-to-list 'org-latex-packages-alist '("newfloat" "minted"))
  (setq! org-latex-pdf-process '("latexmk -f -pdf -xelatex -shell-escape -interaction=nonstopmode -output-directory=%o %f")))



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)

(global-prettify-symbols-mode)


(add-hook! python-mode
  (add-to-list 'prettify-symbols-alist '("int" . 8484))
  (add-to-list 'prettify-symbols-alist '("float" . 8477))
  (add-to-list 'prettify-symbols-alist '("in" . 8712))
  (add-to-list 'prettify-symbols-alist '("inf" . 8734))
  (add-to-list 'prettify-symbols-alist '("<=" . 8804))
  (add-to-list 'prettify-symbols-alist '(">=" . 8805))
  (add-to-list 'prettify-symbols-alist '("->" . 8594))
  (add-to-list 'prettify-symbols-alist '("def" . 402))
  (add-to-list 'prettify-symbols-alist '("True" . 8868))
  (add-to-list 'prettify-symbols-alist '("False" . 8869))
  (add-to-list 'prettify-symbols-alist '("not" . 172))
  (add-to-list 'prettify-symbols-alist '("not in" . 8713))
  (add-to-list 'prettify-symbols-alist '("!=" . 8800)))

(add-hook! haskell-mode
  (add-to-list 'prettify-symbols-alist '("Int" . 8484))
  (add-to-list 'prettify-symbols-alist '("elem" . 8712))
  (add-to-list 'prettify-symbols-alist '("<=" . 8804))
  (add-to-list 'prettify-symbols-alist '(">=" . 8805))
  (add-to-list 'prettify-symbols-alist '("->" . 8594))
  (add-to-list 'prettify-symbols-alist '("<-" . 8592))
  (add-to-list 'prettify-symbols-alist '("=>" . 8658))
  (add-to-list 'prettify-symbols-alist '("not" . 172))
  (add-to-list 'prettify-symbols-alist '("&&" . 8743))
  (add-to-list 'prettify-symbols-alist '("||" . 8744))
  (add-to-list 'prettify-symbols-alist '("\\" . 955))
  ;; (add-to-list 'prettify-symbols-alist '(" . " . 8729))
  (add-to-list 'prettify-symbols-alist '("/=" . 8800)))

(add-hook! coq-mode :append
  (map! :desc "Toggle electric termination mode" :in "C-c C-;" #'proof-electric-terminator-toggle)
  (setq! coq-compile-before-require t)
  (setf (alist-get "bool" prettify-symbols-alist nil 'remove 'string=) 914))

(display-time)

(if (eq system-type 'darwin)
  (display-battery-mode))

(setq doom-modeline-enable-word-count t)

(smartparens-global-mode)

(map! :desc "Goto end of line" :i "C-l" #'evil-append-line)
(map! :desc "End line with return" :i "C-j" (cmd! (evil-append-line 1) (newline) (indent-according-to-mode)))

(map! :desc "Calendar" :n "SPC o c" #'calendar)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(add-to-list 'initial-frame-alist '(fullscreen . fullscreen))

(setq deft-recursive t)

(if (eq system-type 'darwin)
  (setenv "DICTIONARY" "en_US"))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
