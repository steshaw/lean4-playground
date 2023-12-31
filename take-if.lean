inductive Status where
  | Open
  | Closed
deriving BEq, Repr

open Status

structure Issue where 
  id : Int
  status : Status
deriving BEq, Repr

def openIssues (issues : List Issue) := do
  if (issues.any (fun it => it.status == Open)) then
    IO.println "There are some open issues"

def main : IO Unit := do
  let issues := [
    Issue.mk 1 Open,
    Issue.mk 2 Closed,
    Issue.mk 3 Open
  ]
  IO.println "Some open:"
  openIssues issues -- Prints "There are some open issues".
  let allClosed := issues <&> fun it =>
    if it.status == Open then { it with status := Closed } else it
  IO.println "All closed:"
  openIssues allClosed -- Prints nothing.

#eval main
