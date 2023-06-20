#eval Lean.versionString

#eval 1 + 2
#eval 1 + 2 * 5

#eval String.append "Hello, "  "Lean"
#eval "Hello, ".append  "Lean"
#eval String.append "great " (String.append "oak " "tree")
#eval String.append "it is " (if 1 > 2 then "yes" else "no")
#eval 42 + 19
#eval String.append "A" (String.append "B" "C")
#eval String.append (String.append "A" "B") "C"
#eval if 3 == 3 then 5 else 7
#eval if 3 == 4 then "equal" else "not equal"
#eval (1 + 2 : Nat)
#eval 1 - 2
#eval (1 - 2 : Int)
-- #check String.append "hello" [" ", "world"]

def hello := "Hello"
def lean : String := "Lean"
#eval String.append hello (String.append " " lean)
#eval hello ++ " " ++ lean

-- Functions 

def add1 (n : Nat) : Nat := n + 1
#eval add1 7

def maximum (n : Nat) (k : Nat) : Nat :=
  if n < k then
    k
  else n

#eval maximum (5 + 8) (2 * 7)

def joinStringsWith j (s1 : String) s2 :=
  (s1.append j).append s2
#eval joinStringsWith ", " "one" "two"
#check joinStringsWith ": "

def volume (h : Nat) w d := h * w * d
#eval volume 2 3 4

-- Aliases
def Str : Type := String
def aStr : Str := "This is a string"
#eval aStr

def NaturalNumber : Type := Nat
def thirtyEight : NaturalNumber := (38 : Nat)
#eval thirtyEight

abbrev N : Type := Nat
def thirtyNine : N := 39
#eval thirtyNine

-- Structures

#check 1.2
#check 0
#check (0 : Float)

structure Point where
  x : Float
  y : Float
deriving Repr

def p1 : Point := { x := 1, y:= 2 }
#eval p1
#eval p1.x
#eval p1.y
#eval Point.x p1
#eval Point.y p1

def addPoints (p1 : Point) (p2 : Point) : Point :=
  { x := p1.x + p2.x, y := p1.y + p2.y }

def p2 : Point := { x := 3, y := 4 }

#eval addPoints p1 p2

def distance (p1 : Point) (p2 : Point) : Float :=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))

#eval distance { x := 1.0, y := 2.0 } { x := 5.0, y := -1.0 }

structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

def origin3D : Point3D := { x := 0.0, y := 0.0, z := 0.0 }

#eval origin3D

#check ({ x := 0.0, y := 0.0 } : Point)
#check { x := 0.0, y := 0.0 : Point}

def zeroX (p : Point) : Point :=
  { x := 0, y := p.y }

#eval zeroX p1

def Point.zeroX2 (p : Point) : Point :=
  { p with x := 0 }

#eval p1.zeroX2

#check Point.mk
#check (Point.mk)
#check Point.x
#check (Point.x)

structure RectangularPrism where
  width : Float
  height : Float
  depth : Float
deriving Repr

def RectangularPrism.volume1 (p: RectangularPrism) : Float :=
  p.width * p.height * p.depth

def RectangularPrism.volume2 : RectangularPrism -> Float
  | { width := w, height := h, depth := d } => w * h * d

#eval RectangularPrism.volume1 { width := 2.0, height := 3.0, depth := 4.0 }
#eval RectangularPrism.volume2 { width := 2.0, height := 3.0, depth := 4.0 }

#check RectangularPrism
#check RectangularPrism.width
#check RectangularPrism.height
#check RectangularPrism.depth

structure Segment where
  p1 : Point
  p2 : Point
deriving Repr

def Segment.length (s : Segment) : Float :=
  distance s.p1 s.p2

#eval Segment.length { 
  p1 := { x := 1.0, y := 2.0 },
  p2 := { x := 5.0, y := -1.0 }
}

structure Hamster where
  name : String
  fluffy : Bool

#check Hamster
#check Hamster.mk
#check Hamster.name
#check Hamster.fluffy

structure Book where
  makeBook ::
  title : String
  author : String
  price : Float

#eval Book
-- #eval Book.makeBook
-- #eval Book.title
-- #eval Book.author
-- #eval Book.price

