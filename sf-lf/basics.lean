inductive Day : Type :=
  | monday
  | tuesday
  | wednesday
  | thursday
  | friday
  | saturday
  | sunday
deriving Repr

def Day.next_weekday (d : Day) : Day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday

#eval Day.friday.next_weekday
-- Day.monday
#eval Day.saturday.next_weekday.next_weekday
-- Day.tuesday

example test_next_weekday: Day.saturday.next_weekday.next_weekday = Day.tuesday :=
  rfl
