(setq! user-full-name    "Bruno Bonatto"
      user-mail-address "bfbonatto@gmail.com")

(setq! doom-font (font-spec :family "Fira Code" :size 12 :weight 'normal))

(setq! doom-theme 'doom-tomorrow-night)

(setq! display-line-numbers-type 'visual)

(global-prettify-symbols-mode)

(defun sync-path ()
  "Set up Emacs' `exec-path' and PATH environment variable to match the user's shell."
  (interactive)
  (let ((path-from-shell
         (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -c 'echo $PATH'"))))
  (setenv "PATH" path-from-shell)
  (setq! exec-path (split-string path-from-shell path-separator))))
(sync-path)

(if (eq system-type 'darwin)
  (setenv "DICTIONARY" "en_US")
  (setq! mac-option-key-is-meta nil)
  (setq! mac-command-key-is-meta t)
  (setq! mac-command-modifier 'meta)
  (setq! mac-option-modifier nil))

(map! :desc "Push to remote" :n "SPC g p" #'magit-push-current-to-pushremote)

(map! :desc "Move cursor to COUNT-th window left of the current one"  :i "C-h" #'evil-window-left)
(map! :desc "Move cursor to COUNT-th window right of the current one" :i "C-l" #'evil-window-right)
(map! :desc "Move cursor to COUNT-th window up of the current one"    :i "C-k" #'evil-window-up)
(map! :desc "Move cursor to COUNT-th window down of the current one"  :i "C-j" #'evil-window-down)

(setq! evil-split-window-below  t
       evil-vsplit-window-right t)

(map! :desc "Calendar"            :n "SPC o c" #'calendar)
(map! :desc "Calculator"          :n "SPC o C" #'calc)
(map! :desc "Web Browser"         :n "SPC o w" #'eww)
(map! :desc "Dictionary Language" :n "SPC t S" #'ispell-change-dictionary)

(require 'elcord)
(setq! elcord-use-major-mode-as-main-icon t)
(map! :desc "Discord presence" :n "SPC t d" #'elcord-mode)

(display-battery-mode)
(display-time)
(setq! doom-modeline-enable-word-count t
       display-time-day-and-date nil
       display-time-default-load-average nil
       display-time-load-average nil
       doom-modeline-project-detection 'auto
       doom-modeline-major-mode-icon t
       doom-modeline-minor-mode nil
       doom-modeline-buffer-encoding nil
       doom-modeline-continuous-word-count-modes '(markdown-mode org-mode))

(setq! org-directory "~/org/")

(add-hook! python-mode
  (rainbow-delimiters-mode-enable)
  (add-to-list 'prettify-symbols-alist '("int"    . 8484))
  (add-to-list 'prettify-symbols-alist '("float"  . 8477))
  (add-to-list 'prettify-symbols-alist '("in"     . 8712))
  (add-to-list 'prettify-symbols-alist '("inf"    . 8734))
  (add-to-list 'prettify-symbols-alist '("def"    . 402))
  (add-to-list 'prettify-symbols-alist '("True"   . 8868))
  (add-to-list 'prettify-symbols-alist '("False"  . 8869))
  (add-to-list 'prettify-symbols-alist '("not"    . 172))
  (add-to-list 'prettify-symbols-alist '("not in" . 8713)))

(add-hook! haskell-mode
  (add-to-list 'prettify-symbols-alist '("Int"  . 8484))
  (add-to-list 'prettify-symbols-alist '("elem" . 8712))
  (add-to-list 'prettify-symbols-alist '("not"  . 172))
  (add-to-list 'prettify-symbols-alist '("&&"   . 8743))
  (add-to-list 'prettify-symbols-alist '("||"   . 8744))
  (add-to-list 'prettify-symbols-alist '("\\"   . 955)))

(add-hook! coq-mode :append
  (map! :desc "Toggle electric termination mode" :in "C-c C-;" #'proof-electric-terminator-toggle)
  (setq! coq-compile-before-require t))

(add-to-list 'projectile-globally-ignored-file-suffixes ".lock")
(add-to-list 'projectile-globally-ignored-directories "*.stack-work")
