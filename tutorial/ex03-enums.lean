/-
Similar to https://softwarefoundations.cis.upenn.edu/lf-current/Basics.html
-/

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
