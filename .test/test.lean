import assignment

meta def foo : tactic unit :=  do env ← tactic.get_env, tactic.trace (environment.contains env `beer)

theorem check : ∀ (x : Type), x = x :=
begin
  exact exercise, 
end


