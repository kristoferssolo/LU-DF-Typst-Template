#import "@preview/headcount:0.1.0": *
#import "utils.typ": make-abstract, make-documentary-page, make-title

#let indent = 1cm

// This function gets your whole document as its `body` and formats
// it as an article in the style of the IEEE.
#let ludf(
  title: [Title],
  // An array of authors. For each author you can specify a name,
  // location, and email. Everything but but the `name` and `code` is optional.
  authors: (),
  advisors: (),
  reviewer: (),
  // The paper's abstract. Can be omitted if you don't have one.
  abstract: (
    primary: (
      title: "Anotācija",
      keyword-title: "Atslēgvārdi",
      lang: "lv",
      text: [],
      keywords: [],
    ),
    secondary: (
      title: "Abstract",
      keyword-title: "Keywords",
      lang: "en",
      text: [],
      keywords: [],
    ),
  ),
  // The result of a call to the `bibliography` function or `none`.
  bibliography: none,
  university: "Latvijas Universitāte",
  faculty: [Eksakto zinātņu un tehnoloģiju fakultāte\ Datorikas nodaļa],
  thesis-type: "Bakalaura darbs",
  date: datetime.today(),
  place: none,
  logo: none,
  outline-title: "SATURS",
  body,
) = {
  // Set document metadata.
  set document(title: title, author: authors.map(author => author.name))

  // Set the body font.
  set text(
    font: (
      "Times New Roman",
      "New Computer Modern",
    ),
    size: 12pt,
    hyphenate: auto,
    lang: "lv",
    region: "lv",
  )

  // Configure the page.
  set page(
    margin: (left: 30mm, right: 20mm, top: 20mm, bottom: 20mm),
    paper: "a4",
  )


  // Main body.
  set par(
    justify: true,
    leading: 1.5em,
    spacing: 1.5em,
    first-line-indent: (amount: indent, all: true),
  )


  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)
  // show math.equation: set text(weight: 400)


  // Configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // Override equation references.
      link(it.element.location(), numbering(
        it.element.numbering,
        ..counter(math.equation).at(it.element.location()),
      ))
    } else {
      // Other references as usual.
      it
    }
  }


  // Configure lists and terms.
  set list(marker: ([•], [--], [\*], [·]))
  set enum(numbering: "1aiA)")
  set terms(separator: [ -- ])


  // Headings
  set heading(numbering: "1.1.")
  show heading: set block(spacing: 2em)
  show heading: it => {
    if it.level == 1 {
      pagebreak(weak: true)
      text(14pt, align(center, upper(it)))
    } else {
      text(12pt, it)
    }
  }


  // Style bibliography.
  set std.bibliography(title: "Izmantotā literatūra un avoti")

  set quote(block: true)

  // Tables & figures
  show figure: set block(breakable: true) // allow for tables to span to next pages mid sentence
  show figure: set par(justify: false) // disable justify for figures (tables)
  show table.cell.where(y: 0): strong
  set table(align: left)
  show figure: set image(width: 80%)

  set figure(numbering: dependent-numbering("1.1."))
  show figure: set figure.caption(position: top, separator: " ")
  show figure.caption: set align(end)

  show figure.where(kind: image): set figure(supplement: "att")
  show figure.caption.where(kind: image): set align(start)
  show figure.caption: set text(size: 11pt)
  show figure.where(kind: image): set figure.caption(
    position: bottom,
    separator: ". ",
  )
  show heading: reset-counter(counter(figure.where(kind: image)))

  show figure.where(kind: table): set figure(supplement: "tabula")
  show heading: reset-counter(counter(figure.where(kind: table)))

  show figure.where(kind: "attachment"): set figure(numbering: "1.1.")
  show figure.where(kind: "attachment"): set figure.caption(separator: ". ")


  // Adapt supplement in caption independently from supplement used for references.
  show figure: fig => {
    let numbers = numbering(fig.numbering, ..fig.counter.at(fig.location()))
    // Wrap figure captions in block to prevent the creation of paragraphs. In
    // particular, this means `par.first-line-indent` does not apply.
    // See https://github.com/typst/templates/pull/73#discussion_r2112947947.
    show figure.caption: it => block[
      #emph([#numbers~#fig.supplement#it.separator])*#it.body*
    ]
    show figure.caption.where(kind: "attachment"): it => block[
      #numbers~#fig.supplement#it.separator#it.body
    ]
    fig
  }

  // disable default reference suppliments
  // set ref(supplement: it => {})

  // Custom show rule for references
  show ref: it => {
    let el = it.element
    if el == none {
      return it
    }


    let numbers = numbering(
      el.numbering,
      ..counter(el.func()).at(el.location()),
    )


    if el.func() == heading {
      return link(
        el.location(),
        [#numbers #el.body],
      )
    }


    let supplement = if type(it.supplement) == content {
      if it.supplement == [] {
        ""
      } else {
        [~#it.supplement]
      }
    } else {
      [~#it.supplement]
    }

    if el.func() == figure {
      return link(el.location(), [#numbers#supplement])
    }
    it
  }


  // Code blocks
  show raw: set text(
    font: (
      "JetBrainsMono NF",
      "JetBrains Mono",
      "Fira Code",
      "TeX Gyre Cursor",
    ),
    features: (calt: 0),
    ligatures: false,
    spacing: 100%,
  )


  make-title(
    title,
    authors,
    advisors,
    university,
    faculty,
    thesis-type,
    date,
    place,
    logo,
  )

  // Start page numbering
  set page(numbering: "1", number-align: center)


  // Display abstract and keywords.
  if abstract != none {
    make-abstract("primary", abstract.primary)
    make-abstract("secondary", abstract.secondary)
  }

  // Table of contents.
  // Uppercase 1st level headings in ToC
  show outline.entry.where(level: 1): it => {
    upper(it)
  }

  outline(depth: 3, indent: indent, title: text(size: 14pt, outline-title))

  // Display the paper's contents.
  body

  // Display bibliography.
  bibliography

  make-documentary-page(
    title,
    authors,
    advisors,
    reviewer,
    thesis-type,
    date,
  )
}
