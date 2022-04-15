;;; publish.el -*- lexical-binding: t; -*-

;; Install packages
(require 'package)
(package-initialize)
(unless package-archive-contents
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))
(dolist (pkg '(org-contrib ox-hugo plantuml-mode))
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Load packages
(require 'org)
(require 'ox-hugo)

;; Prepare plantuml
(require 'plantuml-mode)
(setq org-plantuml-jar-path plantuml-jar-path)
(defadvice plantuml-download-jar (around auto-confirm compile activate)
  (cl-letf (((symbol-function 'yes-or-no-p) (lambda (&rest args) t))
            ((symbol-function 'y-or-n-p) (lambda (&rest args) t)))
    ad-do-it))
(plantuml-download-jar)

;; Prepare org-babel
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t) (python . t)))

(defun npl-publish-all ()
  (message "Publishing from emacs...")
  (org-babel-execute-buffer t)
  (org-hugo-export-wim-to-md t)
  (message "Finished exporting to markdown"))

;;; publish.el ends here
