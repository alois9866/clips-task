(deffunction find-framework (
  ?framework-type
  ?language
  ?need-green-threads
  ?speed
  ?start-time
  ?actively-developed
  ?good-docs
  ?tiobe
)
  ;(println ?framework-type ?language ?need-green-threads ?speed ?start-time ?actively-developed ?good-docs)
  (bind ?found (
    find-all-facts ((?f framework))
      (and
        (eqs (str-cat ?f:type) ?framework-type)
        (if (or (eq ?language "") (eq ?language "any")) then TRUE else (eqs (str-cat ?f:language) ?language))
        (if (string-to-bool ?need-green-threads) then ?f:has-green-threads else TRUE)
        (>= (speed-to-number ?speed) ?f:speed)
        (>= (speed-to-number ?start-time) ?f:start-time)
        (if (string-to-bool ?actively-developed) then ?f:active else TRUE)
        (>= (quality-to-number ?good-docs) ?f:docs-quality)
      )
    )
  )

  (if (= 0 (length ?found)) then
    FALSE
  else
    (if ?tiobe then
      (bind ?index 999)
      (foreach ?f ?found
        (if (< (fact-slot-value ?f tiobe-index) ?index) then
          (bind ?index (fact-slot-value ?f tiobe-index))
        )
      )
      (bind ?res (create$))
      (foreach ?f ?found
        (if (= (fact-slot-value ?f tiobe-index) ?index) then
          (bind ?res (create$ $?res ?f))
        )
      )
      ?res
    else
      ?found
    )
  )
)

(defrule no-more (declare (salience -1000))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
=>
  (trace ?trace no-more)

  (println "No more questions, choose from appropriate frameworks!")
)

(defrule frameworks-found (declare (salience 5))
  ?updated-ref <- (status (name updated) (val TRUE))
  (status (name trace) (val ?trace))
  ?unable-to-deduce-ref <- (status (name unable-to-deduce) (val FALSE))
  ?deduced-ref <- (status (name deduced) (val FALSE))
  (status (name framework-chosen) (val TRUE))           ; Mandatory attribute.
  (var (name framework-type) (val ?framework-type))
  (var (name language) (val ?language))
  (var (name need-green-threads) (val ?need-green-threads))
  (var (name speed) (val ?speed))
  (var (name start-time) (val ?start-time))
  (var (name actively-developed) (val ?actively-developed))
  (var (name good-docs) (val ?good-docs))
  (status (name docs-chosen) (val ?docs-chosen))
=>
  (trace ?trace no-such-framework)

  (bind ?found (find-framework ?framework-type ?language ?need-green-threads ?speed ?start-time ?actively-developed ?good-docs ?docs-chosen))

  (if (not ?found) then
    (println "UNABLE TO FIND A FRAMEWORK WITH PARAMETERS:")
    (println "Type:                          " ?framework-type)
    (println "Language:                      " ?language)
    (println "Green threads needed:          " ?need-green-threads)
    (println "Minimal request handling speed:" ?speed)
    (println "Minimal start time:            " ?start-time)
    (println "Actively developed:            " ?actively-developed)
    (println "With good documentation:       " ?good-docs)
    (modify ?unable-to-deduce-ref (val TRUE))

    (if (yes-or-no "*** Try again?") then
      (reset)
      (run)
    )
  else
    ;(println "Found frameworks by parameters")
    ;(println "Type:                          " ?framework-type)
    ;(println "Language:                      " ?language)
    ;(println "Green threads needed:          " ?need-green-threads)
    ;(println "Minimal request handling speed:" ?speed)
    ;(println "Minimal start time:            " ?start-time)
    ;(println "Actively developed:            " ?actively-developed)
    ;(println "With good documentation:       " ?good-docs)
    (println "Appropriate frameworks:")
    (print-frameworks ?found)

    (if (or (= 1 (length ?found)) ?docs-chosen (not (yes-or-no "Continue search?"))) then
      (modify ?deduced-ref (val TRUE))
    )
  )

  (modify ?updated-ref (val FALSE))
)

(defrule ask-framework-type (declare (salience 20))
  ?updated-ref <- (status (name updated))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
  ?framework-chosen-ref <- (status (name framework-chosen) (val FALSE))
  ?framework-type-ref <- (var (name framework-type))
=>
  (trace ?trace ask-framework-type)

  (bind ?answer (ask-question "*** Choose framework type:" "full-stack" "server" "client"))
  (println "[Framework type chosen:" (str-cat ?answer "]"))
  (modify ?framework-type-ref (val ?answer))
  (modify ?framework-chosen-ref (val TRUE))

  (modify ?updated-ref (val TRUE))
)

(defrule ask-language (declare (salience 10))
  ?updated-ref <- (status (name updated))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
  ?language-chosen-ref <- (status (name language-chosen) (val FALSE))
  ?language-ref <- (var (name language))
=>
  (trace ?trace ask-language)

  (bind ?answer (ask-question "*** Choose programming language:" "java" "python" "c#" "javascript" "go" "don't care" ""))
  (if (or (eqs ?answer "don't care") (eqs ?answer "")) then
    (println "[Language not chosen.]")
    (modify ?language-ref (val "any"))
  else
    (println "[Language chosen:" (str-cat ?answer "]"))
    (modify ?language-ref (val ?answer))
  )

  (modify ?language-chosen-ref (val TRUE))

  (modify ?updated-ref (val TRUE))
)

(defrule ask-green-threads (declare (salience 8))
  ?updated-ref <- (status (name updated))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
  ?green-threads-chosen-ref <- (status (name green-threads-chosen) (val FALSE))
  ?need-green-threads-ref <- (var (name need-green-threads))
=>
  (trace ?trace ask-green-threads)

  (if (yes-or-no "Do you want to use green threads?") then
    (println "[Choosing among frameworks with green threads.]")
    (modify ?need-green-threads-ref (val "true"))
  else
    (println "[Choosing among all frameworks.]")
    (modify ?need-green-threads-ref (val "false"))
  )

  (modify ?green-threads-chosen-ref (val TRUE))

  (modify ?updated-ref (val TRUE))
)

(defrule ask-speed (declare (salience 6))
  ?updated-ref <- (status (name updated))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
  ?speed-chosen-ref <- (status (name speed-chosen) (val FALSE))
  ?speed-ref <- (var (name speed))
=>
  (trace ?trace ask-speed)

  (bind ?answer (ask-question "*** Choose minimal request handling speed:" "very fast" "fast" "medium" "slow" "don't care" ""))
  (if (or (eqs ?answer "don't care") (eqs ?answer "")) then
    (println "[Request handling speed not chosen.]")
    (modify ?speed-ref (val ""))
  else
    (println "pRequest handling speed chosen:" (str-cat ?answer "]"))
    (modify ?speed-ref (val ?answer))
  )

  (modify ?speed-chosen-ref (val TRUE))

  (modify ?updated-ref (val TRUE))
)

(defrule ask-start-time (declare (salience 4))
  ?updated-ref <- (status (name updated))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
  ?start-time-chosen-ref <- (status (name start-time-chosen) (val FALSE))
  ?start-time-ref <- (var (name start-time))
=>
  (trace ?trace ask-start-time)

  (bind ?answer (ask-question "*** Choose minimal start time speed:" "very fast" "fast" "medium" "slow" "don't care" ""))
  (if (or (eqs ?answer "don't care") (eqs ?answer "")) then
    (println "[Start time speed not chosen.]")
    (modify ?start-time-ref (val ""))
  else
    (println "[Start time speed chosen:" (str-cat ?answer "]"))
    (modify ?start-time-ref (val ?answer))
  )

  (modify ?start-time-chosen-ref (val TRUE))

  (modify ?updated-ref (val TRUE))
)

(defrule ask-actively-developed (declare (salience -2))
  ?updated-ref <- (status (name updated))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
  ?actively-developed-chosen-ref <- (status (name actively-developed-chosen) (val FALSE))
  ?actively-developed-ref <- (var (name actively-developed))
=>
  (trace ?trace ask-actively-developed)

  (if (yes-or-no "Do you want an actively developed framework?") then
    (println "[Choosing among actively developed frameworks.]")
    (modify ?actively-developed-ref (val "true"))
  else
    (println "[Choosing among all frameworks.]")
    (modify ?actively-developed-ref (val "false"))
  )

  (modify ?actively-developed-chosen-ref (val TRUE))

  (modify ?updated-ref (val TRUE))
)

(defrule ask-docs-quality (declare (salience -4))
  ?updated-ref <- (status (name updated))
  (status (name trace) (val ?trace))
  (status (name unable-to-deduce) (val FALSE))
  (status (name deduced) (val FALSE))
  ?docs-chosen-ref <- (status (name docs-chosen) (val FALSE))
  ?good-docs-ref <- (var (name good-docs))
=>
  (trace ?trace ask-docs-quality)

  (if (yes-or-no "Do you want a well documented framework?") then
    (println "[Choosing among frameworks with good documentation.]")
    (modify ?good-docs-ref (val "okay"))
  else
    (println "[Choosing among all frameworks.]")
    (modify ?good-docs-ref (val "don't care"))
  )

  (modify ?docs-chosen-ref (val TRUE))

  (modify ?updated-ref (val TRUE))
)
