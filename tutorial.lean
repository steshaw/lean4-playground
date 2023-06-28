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

#check (String.append)

--example: typeOf (String.append) = (String → String → String) := rfl
example: (String -> String -> String) = (String → String → String) := rfl

example: Nat = Nat := rfl

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

inductive Weekday where
  | sunday
  | monday
  | tuesday
  | wednesday
  | thursday
  | friday
  | saturday

#check Weekday.sunday

open Weekday
#check sunday

def natOfWeekday (d : Weekday) : Nat :=
  match d with
  | sunday    => 1
  | monday    => 2
  | tuesday   => 3
  | wednesday => 4
  | thursday  => 5
  | friday    => 6
  | saturday  => 7

def Weekday.next (d : Weekday) : Weekday :=
  match d with
  | sunday    => monday
  | monday    => tuesday
  | tuesday   => wednesday
  | wednesday => thursday
  | thursday  => friday
  | friday    => saturday
  | saturday  => sunday

def Weekday.previous : Weekday → Weekday
  | sunday    => saturday
  | monday    => sunday
  | tuesday   => monday
  | wednesday => tuesday
  | thursday  => wednesday
  | friday    => thursday
  | saturday  => friday

/- Proving theorems using tactics -/

theorem next_prev_0 (d : Weekday) : d.next.previous = d := by
  cases d; rfl; rfl; rfl; rfl; rfl; rfl; rfl

#print next_prev_0

theorem next_prev_1a (d : Weekday) : d.next.previous = d := 
  match d with
  | sunday => Eq.refl sunday.next.previous
  | monday => Eq.refl monday.next.previous
  | tuesday => Eq.refl tuesday.next.previous
  | wednesday => Eq.refl wednesday.next.previous
  | thursday => Eq.refl thursday.next.previous
  | friday => Eq.refl friday.next.previous
  | saturday => Eq.refl saturday.next.previous

#print next_prev_1a

def next_prev_1b (d : Weekday) : d.next.previous = d := 
  match d with
  | sunday => Eq.refl sunday.next.previous
  | monday => Eq.refl monday.next.previous
  | tuesday => Eq.refl tuesday.next.previous
  | wednesday => Eq.refl wednesday.next.previous
  | thursday => Eq.refl thursday.next.previous
  | friday => Eq.refl friday.next.previous
  | saturday => Eq.refl saturday.next.previous

#print next_prev_1b

theorem Weekday.next_previous_0 (d : Weekday) : d.next.previous = d :=
  match d with
  | sunday    => rfl
  | monday    => rfl
  | tuesday   => rfl
  | wednesday => rfl
  | thursday  => rfl
  | friday    => rfl
  | saturday  => rfl

#print Weekday.next_previous_0

theorem Weekday.next_previous_1 (d : Weekday) : d.next.previous = d := by -- switch to tactic mode
  cases d -- Creates 7 goals
  rfl; rfl; rfl; rfl; rfl; rfl; rfl

#print Weekday.next_previous_1

theorem Weekday.next_previous_2 (d : Weekday) : d.next.previous = d := by
  cases d <;> rfl

#print Weekday.next_previous_2
