(deffunction eqs (?s1 ?s2)
  (= (str-compare ?s1 ?s2) 0)
)

(deffunction neqs (?s1 ?s2)
  (<> (str-compare ?s1 ?s2) 0)
)

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

(deffunction print-frameworks (?fs)
  (bind ?i 1)
  (loop-for-count (length ?fs) do
    (bind ?f (nth$ ?i ?fs))

    (println (fact-slot-value ?f name)
             ":"
             (fact-slot-value ?f language)
             (fact-slot-value ?f type)
             (fact-slot-value ?f speed)
             (fact-slot-value ?f start-time)
             (fact-slot-value ?f has-green-threads)
             (fact-slot-value ?f active)
             (fact-slot-value ?f docs-quality)
    )

    (bind ?i (+ ?i 1))
  )
)

(deffunction e () (exit))

(deffunction ask-question (?question $?allowed-values)
  (println ?question $?allowed-values)
  (bind ?answer (readline))
    (if (lexemep ?answer) then
      (bind ?answer (lowcase ?answer))
    )
    (while (not (member ?answer ?allowed-values)) do
      (println ?question ?allowed-values)
      (bind ?answer (readline))
        (if (lexemep ?answer) then
          (bind ?answer (lowcase ?answer))
        )
    )
    ?answer
)

(deffunction yes-or-no (?question)
  (bind ?response (ask-question ?question "yes" "no" "y" "n" ""))
  (if (or (eq ?response "yes")(eq ?response "y")) then
    TRUE
  else
    FALSE
  )
)

(deffunction speed-to-number (?speed)
  (switch (lowcase ?speed)
    (case "very fast"  then 1)
    (case "fast"       then 2)
    (case "medium"     then 3)
    (case "slow"       then 4)
    (case "don't care" then 4)
    (case ""           then 4)
  )
)

(deffunction quality-to-number (?quality)
  (switch (lowcase ?quality)
    (case "excellent"  then 1)
    (case "okay"       then 2)
    (case "poor"       then 3)
    (case "don't care" then 3)
    (case ""           then 3)
  )
)

(deffunction string-to-bool (?quality)
  (switch (lowcase ?quality)
    (case "true"  then TRUE)
    (case "false" then FALSE)
    (case ""      then FALSE)
  )
)

(defmethod integer ((?s STRING))
   (integer (string-to-field ?s))
)

(deffunction trace (?status ?name)
  (if ?status then (println "[TRACE]" ?name))
)
