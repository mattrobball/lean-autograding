import init.meta.tactic
import system.io
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

theorem check_problem1 : ∀ (x : Type), x = x :=
begin
  check_solutions,
end

#print "Problem 1"
#print axioms check_problem1
#print "---"

theorem check_problem2 : 0 = 1 :=
begin
  check_solutions,
end

#print "Problem 2"
#print axioms check_problem2
#print "---"

theorem check_problem3 : ℕ × ℕ × ℕ :=
begin
  check_solutions,
end

#print "Problem 3"
#print axioms check_problem3
#print "---"

theorem check_problem4 : bool :=
begin
  check_solutions,
end

#print "Problem 4"
#print axioms check_problem4
#print "---"

