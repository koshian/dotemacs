(if (locate-library "elscreen")
    (progn
      (load "elscreen" "ELScreen" t)
      (define-key elscreen-map [(control space)] 'elscreen-next)
      (define-key elscreen-map [(control @)] 'elscreen-next)
      (define-key elscreen-map "\C-@" 'elscreen-next)
      (define-key elscreen-map [?\C-\ ] 'elscreen-next)
      (define-key elscreen-map "@" 'elscreen-next)
      (define-key elscreen-map [?\ ] 'elscreen-next)))
