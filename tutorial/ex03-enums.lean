/-
Similar to https://softwarefoundations.cis.upenn.edu/lf-current/Basics.html
-/

inductive Day where
  | sunday
  | monday
  | tuesday
  | wednesday
  | thursday
  | friday
  | saturday
deriving Repr

#check Day.sunday

open Day
#check sunday

def natOfWeekday (d : Day) : Nat :=
  match d with
  | sunday    => 1
  | monday    => 2
  | tuesday   => 3
  | wednesday => 4
  | thursday  => 5
  | friday    => 6
  | saturday  => 7

def Day.next (d : Day) : Day :=
  match d with
  | sunday    => monday
  | monday    => tuesday
  | tuesday   => wednesday
  | wednesday => thursday
  | thursday  => friday
  | friday    => saturday
  | saturday  => sunday

def Day.previous : Day → Day
  | sunday    => saturday
  | monday    => sunday
  | tuesday   => monday
  | wednesday => tuesday
  | thursday  => wednesday
  | friday    => thursday
  | saturday  => friday

def Day.next_weekday (d : Day) : Day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday

/- Proving theorems using tactics -/

#eval saturday
#eval saturday.next_weekday
#eval saturday.next_weekday.next_weekday

example sat_next_next: saturday.next_weekday.next_weekday = tuesday := rfl

theorem next_prev_0 (d : Day) : d.next.previous = d := by
  cases d; rfl; rfl; rfl; rfl; rfl; rfl; rfl

#print next_prev_0

theorem next_prev_1a (d : Day) : d.next.previous = d := 
  match d with
  | sunday => Eq.refl sunday.next.previous
  | monday => Eq.refl monday.next.previous
  | tuesday => Eq.refl tuesday.next.previous
  | wednesday => Eq.refl wednesday.next.previous
  | thursday => Eq.refl thursday.next.previous
  | friday => Eq.refl friday.next.previous
  | saturday => Eq.refl saturday.next.previous

#print next_prev_1a

def next_prev_1b (d : Day) : d.next.previous = d := 
  match d with
  | sunday => Eq.refl sunday.next.previous
  | monday => Eq.refl monday.next.previous
  | tuesday => Eq.refl tuesday.next.previous
  | wednesday => Eq.refl wednesday.next.previous
  | thursday => Eq.refl thursday.next.previous
  | friday => Eq.refl friday.next.previous
  | saturday => Eq.refl saturday.next.previous

#print next_prev_1b

theorem Day.next_previous_0 (d : Day) : d.next.previous = d :=
  match d with
  | sunday    => rfl
  | monday    => rfl
  | tuesday   => rfl
  | wednesday => rfl
  | thursday  => rfl
  | friday    => rfl
  | saturday  => rfl

#print Day.next_previous_0

theorem Day.next_previous_1 (d : Day) : d.next.previous = d := by -- switch to tactic mode
  cases d -- Creates 7 goals
  rfl; rfl; rfl; rfl; rfl; rfl; rfl

#print Day.next_previous_1

theorem Day.next_previous_2 (d : Day) : d.next.previous = d := by
  cases d <;> rfl

#print Day.next_previous_2
