(deffunction instructions ()
  (println "How to use:")
  (println "#TODO")
  (println)
)

(deffunction ask-question (?question $?allowed-values)
  (println ?question ?allowed-values)
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

(deffunction yes-or-no-p (?question)
  (bind ?response (ask-question ?question "yes" "no" "y" "n"))
  (if (or (eq ?response "yes")(eq ?response "y")) then
    true
  else
    false
  )
)

(deffunction speed-to-number (?speed)
  (switch ?speed
    (case "very fast"  then 1)
    (case "fast"       then 2)
    (case "medium"     then 3)
    (case "slow"       then 4)
    (case "don't care" then 4)
    (case ""           then 4)
  )
)

(deffunction quality-to-number (?quality)
  (switch ?quality
    (case "excellent"  then 1)
    (case "okay"       then 2)
    (case "poor"       then 3)
    (case "don't care" then 3)
    (case ""           then 3)
  )
)

(deffunction string-to-bool (?quality)
  (switch ?quality
    (case "true"  then true)
    (case "false" then false)
    (case ""      then false)
  )
)
