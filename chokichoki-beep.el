;;; chokichoki-beep.el --- Joke beep soft
;;    v.0.0.1 (Last update 2011-03-20)
;;    by Yoshihiko Suhara <@sleepy_yoshi>
;;
;; How to use?
;; 
;; (1) Put chokichoki-beep.el in a load-path directory.
;; (2) Add descriptions in .emacs:
;;       (load "chokichoki-beep")
;;       (setq visible-bell t)
;;       (setq ring-bell-function 'chokichoki-beep)
;;
;;     Or just play with it:
;;       (load "chokichoki-beep")
;;       M-x chokichoki-beep

(defvar chokichoki-beep-interval-time 0.2)
(defvar chokichoki-beep-buffer-name "*chokichoki-beep*")

(defun chokichoki-beep ()
  (interactive)
  (save-excursion
    (switch-to-buffer chokichoki-beep-buffer-name)

    (insert "\n\n\n")
    (insert "            ただいまビープ中\n")
    (insert "        しばらくお待ちください...\n\n")
    (insert "------------------------------>8")

    (move-beginning-of-line nil)
    (let ((count 30))
      (while (<= 0 count)
	(if (= (mod count 2) 0)
	    (progn
	      (save-excursion
		(search-forward ">")
		(replace-match "=")
		(move-end-of-line nil)
		(insert " チョキ")))
	  (progn
	    (save-excursion
	      (search-forward "=")
	      (replace-match ">")
	      (move-end-of-line nil)
	      (delete-backward-char 4))))
	(delete-char 1)
	(redisplay t)
	(sleep-for chokichoki-beep-interval-time)
	(setq count (- count 1))))
    (kill-buffer chokichoki-beep-buffer-name)))

