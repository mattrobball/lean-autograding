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

## Putting them together

The [autograder action](https://github.com/education/autograding) 
which is configured using `.github/classroom/autograding.json`. 

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
- `timeout` : how long to wait until skipping the test 
- `point` : possible points for the test