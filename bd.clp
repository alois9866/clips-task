(deftemplate framework
  (slot name     (type STRING) (default ?NONE))
  (slot language (type SYMBOL) (default ?NONE))
  (slot type     (type SYMBOL) (default ?NONE))

  ; 1 - very fast or not applicable
  ; 2 - fast
  ; 3 - medium
  ; 4 - slow
  (slot speed      (type INTEGER) (default ?NONE))
  (slot start-time (type INTEGER) (default ?NONE))

  ; 1 - excellent
  ; 2 - okay
  ; 3 - poor
  (slot docs-quality (type INTEGER) (default ?NONE))

  ; Possible values: TRUE, FALSE
  (slot has-green-threads (type SYMBOL) (default FALSE))
  (slot active            (type SYMBOL) (default FALSE))

  ; https://www.tiobe.com/tiobe-index/
  (slot tiobe-index (type INTEGER) (default ?NONE))
)

(deftemplate status
  (slot name (type SYMBOL) (default ?NONE))
  (slot val  (type SYMBOL) (default FALSE))
)

(deftemplate var
  (slot name (type SYMBOL) (default ?NONE))
  (slot val  (type STRING) (default ""))
)

(deffacts startup "facts"
  ; Trace logs.
  (status (name trace) (val FALSE))

  ; Exit conditions.
  (status (name unable-to-deduce))
  (status (name deduced))

  (status (name updated))

  ; Status.
  (status (name framework-chosen))
  (status (name language-chosen))
  (status (name green-threads-chosen))
  (status (name speed-chosen))
  (status (name start-time-chosen))
  (status (name actively-developed-chosen))
  (status (name docs-chosen))

  ; Variables.
  (var (name framework-type))
  (var (name language))
  (var (name need-green-threads))
  (var (name speed))
  (var (name start-time))
  (var (name actively-developed))
  (var (name good-docs))

  ; -------------- Java frameworks --------------
  (framework (name "Spring")
    (language java)
    (tiobe-index 2)

    (type full-stack)

    (speed 3)
    (start-time 4)

    (has-green-threads FALSE)

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "JHipster")
    (language java)
    (tiobe-index 2)

    (type full-stack)

    (speed 3)
    (start-time 4)

    (has-green-threads FALSE)

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "Apache Struts")
    (language java)
    (tiobe-index 2)

    (type full-stack)

    (speed 2)
    (start-time 3)

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Play Akka")
    (language java)
    (tiobe-index 2)

    (type server)

    (speed 1)
    (start-time 3)

    (has-green-threads TRUE)

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "JSF")
    (language java)
    (tiobe-index 2)

    (type client)

    (speed 3)
    (start-time 1) ; N/A

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "GWT")
    (language java)
    (tiobe-index 2)

    (type client)

    (speed 2)
    (start-time 1) ; N/A

    (has-green-threads FALSE)

    (docs-quality 3)
    (active TRUE)
  )
  (framework (name "Vaadin")
    (language java)
    (tiobe-index 2)

    (type client)

    (speed 4)
    (start-time 1) ; N/A

    (has-green-threads FALSE)

    (docs-quality 1)
    (active TRUE)
  )

  ; -------------- Python frameworks --------------
  (framework (name "Django")
    (language python)
    (tiobe-index 3)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Flask")
    (language python)
    (tiobe-index 3)

    (type server)

    (speed 3)
    (start-time 1)

    (has-green-threads FALSE)

    (docs-quality 3)
    (active TRUE)
  )
  (framework (name "Pyramid")
    (language python)
    (tiobe-index 3)

    (type full-stack)

    (speed 2)
    (start-time 2)

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Web2Py")
    (language python)
    (tiobe-index 3)

    (type server)

    (speed 3)
    (start-time 2)

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Bottle")
    (language python)
    (tiobe-index 3)

    (type server)

    (speed 2)
    (start-time 1)

    (has-green-threads TRUE)

    (docs-quality 2)
    (active TRUE)
  )

  ; -------------- C# frameworks --------------
  (framework (name "ASP.NET")
    (language c#)
    (tiobe-index 5)

    (type full-stack)

    (speed 2)
    (start-time 4)

    (has-green-threads TRUE) ; It depends.

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "Blazor")
    (language c#)
    (tiobe-index 5)

    (type client)

    (speed 2)
    (start-time 1) ; N/A

    (has-green-threads TRUE) ; It depends.

    (docs-quality 2)
    (active TRUE)
  )

  ; -------------- JavaScript frameworks --------------
  (framework (name "Express.js")
    (language javascript)
    (tiobe-index 7)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads FALSE)

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "Socket.io")
    (language javascript)
    (tiobe-index 7)

    (type full-stack)

    (speed 2)
    (start-time 2)

    (has-green-threads FALSE)

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "Meteor.js")
    (language javascript)
    (tiobe-index 7)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Feathers.js")
    (language javascript)
    (tiobe-index 7)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Angular")
    (language javascript)
    (tiobe-index 7)

    (type client)

    (speed 4)
    (start-time 1) ; N/A

    (has-green-threads FALSE)

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "React.js")
    (language javascript)
    (tiobe-index 7)

    (type client)

    (speed 2)
    (start-time 1) ; N/A

    (has-green-threads FALSE)

    (docs-quality 1)
    (active TRUE)
  )
  (framework (name "Vue.js")
    (language javascript)
    (tiobe-index 7)

    (type client)

    (speed 1)
    (start-time 1) ; N/A

    (has-green-threads FALSE)

    (docs-quality 2)
    (active TRUE)
  )

  ; -------------- Go frameworks --------------
  (framework (name "net.http")
    (language go)
    (tiobe-index 12)

    (type server)

    (speed 2)
    (start-time 1)

    (has-green-threads TRUE)

    (docs-quality 3)
    (active TRUE)
  )
  (framework (name "fast http")
    (language go)
    (tiobe-index 12)

    (type server)

    (speed 1)
    (start-time 1)

    (has-green-threads TRUE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Gin-gonic")
    (language go)
    (tiobe-index 12)

    (type full-stack)

    (speed 3)
    (start-time 2)

    (has-green-threads TRUE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Revel")
    (language go)
    (tiobe-index 12)

    (type full-stack)

    (speed 2)
    (start-time 2)

    (has-green-threads TRUE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Echo")
    (language go)
    (tiobe-index 12)

    (type server)

    (speed 2)
    (start-time 1)

    (has-green-threads TRUE)

    (docs-quality 2)
    (active TRUE)
  )
  (framework (name "Buffalo")
    (language go)
    (tiobe-index 12)

    (type full-stack)

    (speed 3)
    (start-time 2)

    (has-green-threads TRUE)

    (docs-quality 1)
    (active TRUE)
  )
)
