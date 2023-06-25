--
-- See https://serokell.io/blog/learn-from-errors-overlapping-instances
--

class printable (a: Type) :=
  ( print_me : a -> IO Unit )

instance printable_a : printable a :=
  printable.mk (fun _ => IO.println "dummy instance")

instance printable_int: printable Nat where
  print_me n := IO.println $ s!"I am an Int with value {n}"

def fn [pa: printable a] (x:a) := @printable.print_me a pa x

def main := do
  fn "hi"
  fn 5

