variable People : Type

variable Loves : People → People → Prop

-- everybody loves somebody
#check ∀ x:People, ∃ y : People, Loves x y

--everybody only loves themselves
#check ∀ x y:People, Loves x y → x=y

-- everybody loves at most one person
#check ∀ x y z:People, Loves x y → Loves x z → y=z

-- if everybody loves themselves and everybody can only love one person then everybody only loves themselves
example : (∀ x : People, Loves x x)
        → (∀ x y z:People, Loves x y → Loves x z → y=z)
        → (∀ x y:People, Loves x y → x=y) :=
begin
  assume g h,
  assume x y,
  assume l,
  apply h,
  apply g,
  exact l,
end

variables A :Type -- A is a type
variables PP QQ : A -> Prop -- PP and QQ are functions which take A and return a prop
variable R : Prop -- R is a proposition

-- A -- student
-- PP x -- x is clever
-- R -- the lecturer is happy
