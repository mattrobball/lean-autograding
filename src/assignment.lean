variables x y z : Type 
axiom some_axiom : x = y 

lemma exercise : x = x := 
begin
  refl,
end
