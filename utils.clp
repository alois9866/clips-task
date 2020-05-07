(deffunction print ($?args)
  (foreach ?arg ?args
    (if (neq ?arg "") then
      (printout t ?arg " ")
    )
  )
)

(deffunction println ($?args)
  (print $?args)
  (printout t crlf)
)

(deffunction e () (exit))
