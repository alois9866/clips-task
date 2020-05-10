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

(deffunction e () (exit))

(deffunction ask-question (?question $?allowed-values)
  (print ?question " ")
  (foreach ?v ?allowed-values
    (printout t "'" ?v "' ")
  )
  (println)
  (print ">")
  (bind ?answer (readline))
    (if (lexemep ?answer) then
      (bind ?answer (lowcase ?answer))
    )
    (while (not (member ?answer ?allowed-values)) do
      (print ?question " ")
      (foreach ?v ?allowed-values
        (printout t "'" ?v "' ")
      )
      (println)
      (print ">")
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

(deffunction number-to-speed (?speed)
  (switch ?speed
    (case 1 then "very fast")
    (case 2 then "fast")
    (case 3 then "medium")
    (case 4 then "slow")
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

(deffunction number-to-quality (?quality)
  (switch ?quality
    (case 1 then "excellent")
    (case 2 then "okay")
    (case 3 then "poor")
  )
)

(deffunction string-to-bool (?s)
  (switch (lowcase ?s)
    (case "true"  then TRUE)
    (case "false" then FALSE)
    (case ""      then FALSE)
  )
)

(deffunction bool-to-string (?t)
  (switch ?t
    (case TRUE  then "yes")
    (case FALSE then "no")
  )
)

(deffunction print-frameworks (?fs)
  (if (> (length ?fs) 0) then
    (println "| name                 | language   | type       | speed     | start time | green threads | active | documentation |")
  )
  (if (> (length ?fs) 1) then
    (bind ?i 1)
    (loop-for-count (length ?fs) do
      (bind ?f (nth$ ?i ?fs))
      (format t
              "| %-20s | %-10s | %-10s | %-9s | %-10s | %-13s | %-6s | %-13s |%n"
              (fact-slot-value   ?f name)
              (fact-slot-value   ?f language)
              (fact-slot-value   ?f type)
              (number-to-speed   (fact-slot-value ?f speed))
              (number-to-speed   (fact-slot-value ?f start-time))
              (bool-to-string    (fact-slot-value ?f has-green-threads))
              (bool-to-string    (fact-slot-value ?f active))
              (number-to-quality (fact-slot-value ?f docs-quality))
      )
      (bind ?i (+ ?i 1))
    )
  else (if (= (length ?fs) 1) then
          (bind ?f (nth$ 1 ?fs))
          (format t
                  "| %-20s | %-10s | %-10s | %-9s | %-10s | %-13s | %-6s | %-13s |%n"
                  (fact-slot-value   ?f name)
                  (fact-slot-value   ?f language)
                  (fact-slot-value   ?f type)
                  (number-to-speed   (fact-slot-value ?f speed))
                  (number-to-speed   (fact-slot-value ?f start-time))
                  (bool-to-string    (fact-slot-value ?f has-green-threads))
                  (bool-to-string    (fact-slot-value ?f active))
                  (number-to-quality (fact-slot-value ?f docs-quality))
           )
           (println "PERFECT MATCH!")
       )
  )
)

(deffunction trace (?status ?name)
  (if ?status then (println "[TRACE]" ?name))
)
