// Example usage of the Computer Science Lecture Notes template
#import "@local/cs-lecture-notes:0.1.0": *

// Apply the template with your parameters
#show: cs-lecture-notes.with(
  course: "Computer Science 101",
  subject: "Core Concepts",
  author: "John Doe",
  email: "johndoe@example.com", // This is optional
  show-outline: true,
  paper: "a4",
)

= Code Blocks

This section demonstrates how to include code blocks in your lecture notes using the #link("https://typst.app/universe/package/codly")[codly] package. Code blocks are useful for showing programming examples, syntax demonstrations, or algorithm implementations in various languages.

Below are a couple of examples:

```rust
pub fn main() {
    println!("Hello, world!");
}
```

```python
def fib(n):
  if n <= 1:
    return n
  else:
    return fib(n - 1) + fib(n - 2)
print(fib(25))
```

= Admonitions

Admonitions allow you to include visually distinct callouts to highlight important information. These are great for emphasizing tips, warnings, examples, and extra info during lectures.

These clues are created using the #link("https://typst.app/universe/package/gentle-clues")[gentle-clues] package:

#info[Use info boxes to highlight background knowledge or context.]

#warning[Warnings are perfect for common mistakes or critical caveats.]

#tip[Tips are great for best practices, shortcuts, or helpful advice.]

#example[Examples are used to clarify concepts with concrete scenarios.]

= Proof Trees

Proof trees are a visual way to represent logical derivations or inference steps. They are commonly used in logic, type theory, and formal systems.

This section uses the #link("https://typst.app/universe/package/curryst")[curryst] package to typeset formal proofs. You can define premises, apply rules, and construct derivations with clarity.

Here’s a generic proof tree layout:

#align(center)[
  #prooftree(rule(
    label: [Label],
    name: [Rule name],
    [Conclusion],
    [Premise 1],
    [Premise 2],
    [Premise 3],
  ))
]

And here's a natural deduction proof showing implication introduction:

#align(center)[
  #prooftree(impl-i($tack (p -> q) -> not (p and not q)$, not-i(
    $p -> q tack not (p and not q)$,
    not-e(
      $ underbrace(p -> q\, p and not q, Gamma) tack bot $,
      impl-e($Gamma tack q$, ax($Gamma tack p -> q$), and-el($Gamma tack p$, ax(
        $Gamma tack p and not q$,
      ))),
      and-er($Gamma tack not q$, ax($Gamma tack p and not q$)),
    ),
  )))
]

= Finite State Machines

Finite state machines (FSMs) are used to model systems with discrete states and transitions. This is common in automata theory, language processing, and hardware design.

With the #link("https://typst.app/universe/package/finite")[finite] package, you can visually define FSMs using a clear syntax.

Here is an example automaton:

#align(center)[
  #automaton(
    (
      q0: (q1: 0, q0: "0,1"),
      q1: (q0: (0, 1), q2: "0"),
      q2: none,
    ),
    initial: "q1",
    final: ("q0",),
  )
]

= Data Visualisation

Data visualisation helps present trends, comparisons, or distributions in a clear, visual format. It’s especially useful when discussing performance metrics, simulation results, or algorithmic behavior.

This example uses the #link("https://typst.app/universe/package/lilaq")[lilaq] package, which provides plotting utilities for line charts and other diagram types.

#align(center)[
  #let xs = (0, 1, 2, 3, 4)

  #lq.diagram(
    title: [Precious data],
    xlabel: $x$,
    ylabel: $y$,

    lq.plot(xs, (5, 4, 2, 1, 2), mark: "s", label: [A]),
    lq.plot(xs, (2, 5, 4, 2, 3), mark: "o", label: [B]),
  )
]

= Pseudocode

Pseudocode is a great way to illustrate algorithms without being tied to a specific programming language. It emphasizes logic and structure rather than syntax.

The #link("https://typst.app/universe/package/lovelace")[lovelace] package provides tools for typesetting pseudocode lists in a structured, readable format.

Here’s an example representing a generic control flow:

#pseudocode-list[
  + do something
  + do something else
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
]
