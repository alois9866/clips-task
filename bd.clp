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

  ; Possible values: true, false
  (slot has-green-threads (type SYMBOL) (default false))
  (slot active            (type SYMBOL) (default false))

  ; https://www.tiobe.com/tiobe-index/
  (slot tiobe-index (type INTEGER) (default ?NONE))
)

(deffacts startup "facts"

  ; -------------- Java frameworks --------------
  (framework (name "Spring")
    (language Java)
    (tiobe-index 2)

    (type full-stack)

    (speed 3)
    (start-time 4)

    (has-green-threads false)

    (docs-quality 1)
    (active true)
  )
  (framework (name "JHipster")
    (language Java)
    (tiobe-index 2)

    (type full-stack)

    (speed 3)
    (start-time 4)

    (has-green-threads false)

    (docs-quality 1)
    (active true)
  )
  (framework (name "Apache Struts")
    (language Java)
    (tiobe-index 2)

    (type full-stack)

    (speed 2)
    (start-time 3)

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Play Akka")
    (language Java)
    (tiobe-index 2)

    (type server)

    (speed 1)
    (start-time 3)

    (has-green-threads true)

    (docs-quality 1)
    (active true)
  )
  (framework (name "JSF")
    (language Java)
    (tiobe-index 2)

    (type client)

    (speed 3)
    (start-time 1) ; N/A

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )
  (framework (name "GWT")
    (language Java)
    (tiobe-index 2)

    (type client)

    (speed 2)
    (start-time 1) ; N/A

    (has-green-threads false)

    (docs-quality 3)
    (active true)
  )
  (framework (name "Vaadin")
    (language Java)
    (tiobe-index 2)

    (type client)

    (speed 4)
    (start-time 1) ; N/A

    (has-green-threads false)

    (docs-quality 1)
    (active true)
  )

  ; -------------- Python frameworks --------------
  (framework (name "Django")
    (language Python)
    (tiobe-index 3)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Flask")
    (language Python)
    (tiobe-index 3)

    (type server)

    (speed 3)
    (start-time 1)

    (has-green-threads false)

    (docs-quality 3)
    (active true)
  )
  (framework (name "Pyramid")
    (language Python)
    (tiobe-index 3)

    (type full-stack)

    (speed 2)
    (start-time 2)

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Web2Py")
    (language Python)
    (tiobe-index 3)

    (type server)

    (speed 3)
    (start-time 2)

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Bottle")
    (language Python)
    (tiobe-index 3)

    (type server)

    (speed 2)
    (start-time 1)

    (has-green-threads true)

    (docs-quality 2)
    (active true)
  )

  ; -------------- C# frameworks --------------
  (framework (name "ASP.NET")
    (language C#)
    (tiobe-index 5)

    (type full-stack)

    (speed 2)
    (start-time 4)

    (has-green-threads true) ; It depends.

    (docs-quality 1)
    (active true)
  )
  (framework (name "Blazor")
    (language C#)
    (tiobe-index 5)

    (type client)

    (speed 2)
    (start-time 1) ; N/A

    (has-green-threads true) ; It depends.

    (docs-quality 2)
    (active true)
  )

  ; -------------- JavaScript frameworks --------------
  (framework (name "Express.js")
    (language JavaScript)
    (tiobe-index 7)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads false)

    (docs-quality 1)
    (active true)
  )
  (framework (name "Socket.io")
    (language JavaScript)
    (tiobe-index 7)

    (type full-stack)

    (speed 2)
    (start-time 2)

    (has-green-threads false)

    (docs-quality 1)
    (active true)
  )
  (framework (name "Meteor.js")
    (language JavaScript)
    (tiobe-index 7)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Feathers.js")
    (language JavaScript)
    (tiobe-index 7)

    (type full-stack)

    (speed 3)
    (start-time 3)

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Angular")
    (language JavaScript)
    (tiobe-index 7)

    (type client)

    (speed 4)
    (start-time 1) ; N/A

    (has-green-threads false)

    (docs-quality 1)
    (active true)
  )
  (framework (name "React.js")
    (language JavaScript)
    (tiobe-index 7)

    (type client)

    (speed 2)
    (start-time 1) ; N/A

    (has-green-threads false)

    (docs-quality 1)
    (active true)
  )
  (framework (name "Vue.js")
    (language JavaScript)
    (tiobe-index 7)

    (type client)

    (speed 1)
    (start-time 1) ; N/A

    (has-green-threads false)

    (docs-quality 2)
    (active true)
  )

  ; -------------- Go frameworks --------------
  (framework (name "net.http")
    (language Go)
    (tiobe-index 12)

    (type server)

    (speed 2)
    (start-time 1)

    (has-green-threads true)

    (docs-quality 3)
    (active true)
  )
  (framework (name "fast http")
    (language Go)
    (tiobe-index 12)

    (type server)

    (speed 1)
    (start-time 1)

    (has-green-threads true)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Gin-gonic")
    (language Go)
    (tiobe-index 12)

    (type full-stack)

    (speed 3)
    (start-time 2)

    (has-green-threads true)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Revel")
    (language Go)
    (tiobe-index 12)

    (type full-stack)

    (speed 2)
    (start-time 2)

    (has-green-threads true)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Echo")
    (language Go)
    (tiobe-index 12)

    (type server)

    (speed 2)
    (start-time 1)

    (has-green-threads true)

    (docs-quality 2)
    (active true)
  )
  (framework (name "Buffalo")
    (language Go)
    (tiobe-index 12)

    (type full-stack)

    (speed 3)
    (start-time 2)

    (has-green-threads true)

    (docs-quality 1)
    (active true)
  )
)
