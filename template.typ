#let project(
  title: "",
  abstract: [],
  authors: (),
  date: none,
  logo: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    margin: (left: 30mm, right: 20mm, top: 20mm, bottom: 20mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: "Libertinus Serif", lang: "lv")
  set heading(numbering: "1.1.")

  // Set run-in subheadings, starting at level 3.
  show heading: it => {
    if it.level > 2 {
      parbreak()
      text(11pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }


  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 26%))
  }
  v(9.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)

  // Author information.
  pad(top: 0.7em, right: 20%, grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => align(start, strong(author))),
  ))

  v(2.4fr)
  pagebreak()

  // Abstract page.
  v(1fr)
  align(center)[
    #heading(outlined: false, numbering: none, text(0.85em, smallcaps[Abstract]))
    #abstract
  ]
  v(1.618fr)
  pagebreak()

  // Table of contents.
  outline(depth: 3, indent: true)
  pagebreak()


  // Main body.
  set par(justify: true)

  body
}
