(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/lisp")

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'cedit
                          'editorconfig
                          'evil
                          'helm
                          'iedit
                          'magit
                          'org
                          'projectile
                          'helm-projectile)

(evil-mode 1)
(helm-mode 1)
(editorconfig-mode 1)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-linum-mode t)

(setq make-backup-files nil)
