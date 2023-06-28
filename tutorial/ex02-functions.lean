def twice (f : Nat → Nat) (a : Nat) := f (f a)

#check twice
#check (twice)

#check (String.append)

example: type_of% String.append = (String → String → String) := rfl
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
