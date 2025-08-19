#let indent = 1cm
#let indent-par(body) = par(h(indent) + body)

#let merge(a, b) = {
  let result = a
  for (k, v) in b { result.at(k) = v }
  result
}

#let render-abstract(role, abstract) = {
  // Define role-based defaults
  let defaults = if role == "primary" {
    (
      lang: "lv",
      title: "Anotācija",
      keyword-title: "Atslēgvārdi",
      text: [],
      keywords: [],
    )
  } else {
    (
      lang: "en",
      title: "Abstract",
      keyword-title: "Keywords",
      text: [],
      keywords: [],
    )
  }

  // Merge defaults with overrides
  let abs = merge(defaults, abstract)

  context [
    #set text(lang: abs.lang)
    #heading(
      level: 1,
      outlined: false,
      numbering: none,
      abs.title,
    )

    // Abstract body text
    #abs.text

    // Keywords
    #par(first-line-indent: 0cm)[
      *#abs.keyword-title*: #abs.keywords.join(", ").
    ]
  ]
}

// This function gets your whole document as its `body` and formats
// it as an article in the style of the IEEE.
#let ludf(
  title: [Paper Title],
  // An array of authors. For each author you can specify a name,
  // location, and email. Everything but but the `name` and `code` is optional.
  authors: (),
  advisors: (),
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
  date: none,
  place: none,
  logo: none,
  outline-title: "SATURS",
  replace-math-dot-with-comma: true,
  body,
) = {
  // Set document metadata.
  set document(title: title, author: authors.map(author => author.name))

  // Set the body font.
  set text(
    font: ("Times New Roman", "New Computer Modern", "TeX Gyre Termes"),
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


  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)
  // show math.equation: set text(weight: 400)

  // replace `.` with `,`
  if replace-math-dot-with-comma == true {
    show math.equation: it => {
      show regex("\d+\.\d+"): num => {
        show ".": math.class("normal", ",")
        num
      }
      it
    }
  }

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
  show heading: set block(spacing: 1.5em)
  show heading: it => {
    if it.level == 1 {
      pagebreak(weak: true)
      text(14pt, align(center, upper(it)))
    } else {
      text(12pt, it)
    }
    ""
    v(-indent)
  }


  // Style bibliography.
  // show std.bibliography: set block(spacing: 0.5em)
  set std.bibliography(title: "Izmantotā literatūra un avoti")

  set quote(block: true)

  show table.cell.where(y: 0): strong


  // Main body.
  set par(
    justify: true,
    leading: 1.5em,
    first-line-indent: indent,
    spacing: 1.5em,
  )


  // Display the paper's title and authors at the top of the page,
  // spanning all columns (hence floating at the scope of the
  // columns' parent, which is the page).
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  align(center, upper(text(size: 16pt, [
    #university\
    #faculty
  ])))

  v(1fr)

  align(center, upper(text(20pt, weight: "bold", title)))

  v(0.2fr)

  align(center, upper(text(size: 16pt, thesis-type)))

  v(1fr)

  // Author information
  align(right, [
    #text(
      weight: "bold",
      "Darba " + if authors.len() > 1 { "autori:" } else { "autors:" },
    )\
    #authors.map(author => [#author.name, #author.code]).join("\n")

    #v(1em)

    #if advisors.len() > 0 [
      #text(
        weight: "bold",
        "Darba " + if advisors.len() > 1 { "vadītāji:" } else { "vadītājs:" },
      )\
      #advisors.map(advisor => [#advisor.title #advisor.name]).join("\n")
    ]
  ])

  v(0.5fr)

  align(center, upper([#place #date]))


  // Start page numbering
  set page(numbering: "1", number-align: center)


  // Display abstract and keywords.
  if abstract != none {
    render-abstract("primary", abstract.primary)
    render-abstract("secondary", abstract.secondary)
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
}

