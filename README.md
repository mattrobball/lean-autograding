# Automatic grading of mathematics assignments with Lean and GitHub Classroom

We provide a basic setup that integrates the 
[Lean Theorem Prover](leanprover.github.io) with 
[GitHub Classroom](https://classroom.github.com).

### Why GitHub Classroom?

The advantages of GitHub Classroom for an instructor include:
- [Integration with your LMS](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/connect-a-learning-management-system-to-github-classroom) 
- Automated distribution of assignments for 
[individuals](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/create-an-individual-assignment) or 
[teams](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/create-a-group-assignment)
- Use of the GitHub Pull Request workflow to provide 
[precise feedback](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/leave-feedback-with-pull-requests) 
on assignments
- [Autograding](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/use-autograding) 
that provides immediate feedback allowing for multiple iterations of 
the submission, feedback, learning cycle. All grades are collected 
and easily exported. 
- Highly extensible workflow backed by 
[GitHub Actions](https://github.com/features/actions)

### Why Lean?

The Lean Interactive Theorem Prover is powerful language for 
expressing sophisticated mathematicial structures and for 
verifying correctness of arguments. 

With a Lean verified proof, you can be sure of correctness. 

## Autograder configuration

The [autograder action](https://github.com/education/autograding) 
is configured using `.github/classroom/autograding.json`. This 
controls the tests. 

The fields are 
- `name`: a name you give to each test to run, e.g. Exercise 5
- `setup` : shell command to run for setup 
- `run` : the actual command for scoring the assignment. If it 
outputs to `stderr` it triggers a failure but this can be 
congifured using fields below
- `input` : additional input to your `run` command 
- `output` : comparison output to that for `run` 
- `comparison` : how to compare, either `exact`, `included`, or 
`regex`
- `timeout` : how long to wait in milliseconds until skipping the test 
- `points` : possible points for the test

## Our setup

We use the `setup` command to runthe 
[elan](https://github.com/leanprover/elan)
install script and then call `leanpkg` in directory root. 

The file `.test/test.lean` imports `src/assignment.lean` and 
tests that an exercise of the form 
```lean
lemma exercise : S
```
has produced a term of the correct type `T` with 
```lean
theorem check : T :=
begin
  exact exercise, 
end
```
For the test we run `lean .test/test.lean`. 

If `assignment.lean` has errors or warnings, the test fails 
as these propogate to `test.lean`. 

If `exercise` has the wrong type, then the test fails. 

So far this is fairly basic but suffices for assignments where 
you provide the lean template and students have to fill 
in the proofs sorry-free. 

## How to deploy

First, clone this repository to your account. Then edit `assignment.lean` 
and `test.lean` to fit your needs. 

When creating your assignment, select your repository as the 
[template repository](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/create-an-individual-assignment#choosing-a-template-repository). 
