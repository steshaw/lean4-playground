def a0 : Array Nat := #[1, 2, 3]
def xs : List Nat := [1, 2, 3]

-- Use a namespace to avoid collision with the builtin `List` type.
namespace MyList

inductive List (α : Type) where
  | Nil : List α
  | Cons : α -> List α -> List α
  deriving Repr

partial def buildList (n : Nat) (acc : List Nat) : List Nat :=
    if n == 0
      then acc 
      else buildList (n - 1) (List.Cons n acc)

def xs := buildList (n := 7) (acc := List.Nil)

#eval xs
