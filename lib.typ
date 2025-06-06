// Computer Science Lecture Notes Template
// Usage: #import "cs-lecture-notes.typ": *
// Then: #show: cs-lecture-notes.with(course: "Your Course", subject: "Your Subject", author: "Your Name")

// Packages
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/gentle-clues:1.2.0": *
#import "@preview/curryst:0.5.1": prooftree, rule
#import "@preview/finite:0.5.0": automaton
#import "@preview/lilaq:0.3.0" as lq
#import "@preview/lovelace:0.3.0": *

// Helper functions for proof trees with common rules
#let ax = rule.with(name: [ax])
#let and-el = rule.with(name: $and_e^ell$)
#let and-er = rule.with(name: $and_e^r$)
#let impl-i = rule.with(name: $scripts(->)_i$)
#let impl-e = rule.with(name: $scripts(->)_e$)
#let not-i = rule.with(name: $not_i$)
#let not-e = rule.with(name: $not_e$)

#let cs-lecture-notes(
  course: "Course Name",
  subject: "Lecture Subject",
  author: none,
  email: none,
  show-outline: true,
  paper: "a4",
  body,
) = {
  // Variables for text styling
  let global-font-size = 13pt
  let course-weight = "bold"
  let subject-weight = "medium"

  // Document setup
  set text(size: global-font-size)
  set document(title: course, author: if author != none {
    author
  } else {
    "Author Name"
  })
  set page(paper: paper, numbering: "1", header: align(horizon)[
    #context [
      #if counter(page).get().first() > 1 [
        #text(0.9em, weight: course-weight)[#course] #h(1fr) #text(
          0.9em,
          weight: subject-weight,
        )[#subject]
      ]
    ]
  ])
  set heading(numbering: "1.1.")

  // Styling rules
  show link: underline
  show: codly-init.with()
  codly(
    languages: codly-languages,
    zebra-fill: none,
    radius: 0em,
    lang-radius: 0em,
    lang-outset: (x: 0.39em, y: 0em),
    highlight-radius: 0em,
  )

  // Title
  align(center)[
    #block(text(weight: course-weight, 1.75em, course))
    #v(1em, weak: true)
    #text(weight: subject-weight, 1.2em, subject)
    #v(1em, weak: true)
    #datetime.today().display("[month repr:long] [day], [year]")
  ]

  // Author information
  if author != none [
    #pad(top: 0.5em, bottom: 0.5em, x: 2em, align(center)[
      *#author* #if email != none [\ #email]
    ])
  ]

  // Optional outline
  if show-outline {
    outline()
    pagebreak()
  }

  // Document body
  set par(justify: true)
  body
}

