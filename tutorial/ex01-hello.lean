#eval "hello" ++ " " ++ "world"

#eval (String.append "hello" " ").append "world"
#eval ("hello".append " ").append "world"

#check true

def x := 10 -- x : Nat

#check x + 2
#eval x + 2

def double (x : Int) := 2*x

#check double
#check (double)
#eval double 3
example : double 4 = 8 := rfl
