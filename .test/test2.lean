import tactic
import assignment

open tactic

meta def in_import (env : environment) (n : name) (path : string) : bool :=
(env.decl_olean n = path) && env.contains n && (n ∉ [``quot, ``quot.mk, ``quot.lift, ``quot.ind])

meta def exact_list : list name → tactic unit 
| [] := failed
| (H :: Hs) := do 
                  e ← mk_const H,
                  exact e <|> exact_list Hs

meta def check_solutions : tactic unit :=
do env <- get_env,
   let decls := env.fold [] list.cons,
   cwd ← unsafe_run_io io.env.get_cwd,
   let names := decls.map declaration.to_name,
   let assignment_names := names.filter
     (λ x, in_import env x (cwd ++ "/src/assignment.lean") && not x.is_internal),
   exact_list assignment_names

theorem check : ∀ (x : Type), x = x :=
begin
  check_solutions,
end
#print axioms check 