--import Control.Monad (when)

inductive Status where
  | Open
  | Closed
deriving BEq, Repr

open Status

structure Issue where 
  id : Int
  status : Status
deriving BEq, Repr

def when (b: Bool) (act: IO Unit) : IO Unit :=
  if b then act else pure ()

def openIssues (issues : List Issue) := 
  when (issues.any (fun it => it.status == Open)) <|
    IO.println "There are some open issues"

def main : IO Unit := do
  let issues := [
     { id := 1, status := Open },
     { id := 2, status := Closed },
     { id := 3, status := Open }
  ]
  IO.println "Some open:"
  openIssues issues -- Prints "There are some open issues".
  let allClosed := issues.map $ fun it =>
    if it.status == Open then { it with status := Closed } else it
  IO.println "All closed:"
  openIssues allClosed -- Prints nothing.

#eval main
