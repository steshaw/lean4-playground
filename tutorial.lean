/-
Code from video https://youtu.be/S-aGjgIDQZY
-/

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

---

def twice (f : Nat → Nat) (a : Nat) := f (f a)

#check twice
#check (twice)

example: ((Nat → Nat) → Nat → Nat) = ((Nat → Nat) -> (Nat → Nat)) := rfl

#eval twice (fun x => x + 2) 10
#eval twice (· + 2) 10

def twicePlus2a := twice (fun x => x + 2)
def twicePlus2b := twice (. + 2)
#eval twicePlus2a 10
#eval twicePlus2b 10

theorem twice_add_2 (a : Nat) : twice (fun x => x + 2) a = a + 4 := rfl
theorem twice_1 : twicePlus2a = twicePlus2b := rfl

---

