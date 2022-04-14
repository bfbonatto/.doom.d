;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq! user-full-name    "Bruno Bonatto"
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
(setq! doom-font (font-spec :family "FiraCode Nerd Font" :size 12 :weight 'normal))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq! doom-theme 'doom-tomorrow-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq! org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq! display-line-numbers-type 'visual)

(setq fancy-splash-image "~/Downloads/lambda-copy.png")

(global-prettify-symbols-mode)

(plist-put! +ligatures-extra-symbols
            :list  nil
            :str   nil
            :pipe  nil
            :true  8868
            :false 8869)

(map! :desc "Tangle all src blocks in current file" :mode org-mode :n "SPC m E" #'org-babel-tangle)

(add-hook! python-mode
  (rainbow-delimiters-mode-enable))

(add-hook! coq-mode :append
  (map! :desc "Toggle electric termination mode" :in "C-c C-;" #'proof-electric-terminator-toggle)
  (setq! coq-compile-before-require t))

(map! :desc "Push to remote" :n "SPC g p" #'magit-push-current-to-pushremote)

(display-battery-mode)
(display-time)
(setq!
 doom-modeline-enable-word-count t
 display-time-day-and-date nil
 display-time-default-load-average nil
 display-time-load-average nil
 doom-modeline-project-detection 'auto
 doom-modeline-major-mode-icon t
 doom-modeline-minor-modes nil
 doom-modeline-buffer-encoding nil
 doom-modeline-continuous-word-count-modes '(markdown-mode org-mode))


(if (eq system-type 'darwin)
    (setenv "DICTIONARY" "en_US")
  (setq! mac-option-key-is-meta nil)
  (setq! mac-command-key-is-meta t)
  (setq! mac-command-modifier 'meta)
  (setq! mac-option-modifier nil))

(smartparens-global-mode)

(map! :desc "Move cursor to COUNT-th window left of the current one"  :i "C-h" #'evil-window-left)
(map! :desc "Move cursor to COUNT-th window right of the current one" :i "C-l" #'evil-window-right)
(map! :desc "Move cursor to COUNT-th window up of the current one"    :i "C-k" #'evil-window-up)
(map! :desc "Move cursor to COUNT-th window down of the current one"  :i "C-j" #'evil-window-down)

(setq! evil-split-window-below  t
       evil-vsplit-window-right t)

(map! :desc "Calendar"    :n "SPC o c" #'calendar)
(map! :desc "Calculator"  :n "SPC o C" #'calc)
(map! :desc "Web Browser" :n "SPC o w" #'eww)
(map! :desc "Dictionary Language" :n "SPC t S" #'ispell-change-dictionary)

(require 'elcord)
(setq! elcord-use-major-mode-as-main-icon t)
(map! :desc "Discord presence" :n "SPC t d" #'elcord-mode)

(map! :desc "Dictionary Language" :n "SPC t S" #'ispell-change-dictionary)

;; Automatically sync 'exec-path with "$PATH"
(defun sync-path ()
  "Set up Emacs' `exec-path' and PATH environment variable to match the user's shell."
  (interactive)
  (let ((path-from-shell
         (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(sync-path)

(after! projectile
  (add-to-list 'projectile-globally-ignored-file-suffixes ".lock")
  (add-to-list 'projectile-globally-ignored-directories "*.stack-work"))

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
