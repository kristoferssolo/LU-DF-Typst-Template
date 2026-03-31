#import "@preview/solo-lu-df:2.0.0": *

#show: ludf.with(
  title: "Kursa Darba Nosaukums",
  thesis-type: "course",
  authors: (
    (
      name: "Jānis Bērziņš",
      code: "jb12345",
      location: [Riga, Latvia],
      email: "jb12345@edu.lu.lv",
    ),
  ),
  advisors: (
    (
      title: "Mg. dat.",
      name: "Ivars Ozoliņš",
    ),
  ),
  reviewer: (
    title: "Prof. Dr. Phys.",
    name: "Anna Liepa",
  ),
  submission-date: datetime(
    year: 2025,
    month: 1,
    day: 1,
  ),
  defense-date: datetime(
    year: 2025,
    month: 1,
    day: 15,
  ),
  place: "Rīga",
  bibliography: bibliography("bibliography.yml"),
  abstract: (
    primary: (
      text: [
        #lorem(50)

        #lorem(30)

        #lorem(20)
      ],
      keywords: (
        "Foo",
        "Bar",
        "Baz",
      ),
    ),
    secondary: (
      text: [
        #lorem(20)

        #lorem(30)

        #lorem(50)
      ],
      keywords: (
        "foo",
        "bar",
        "baz",
      ),
    ),
  ),
)

#set heading(numbering: none)
= Apzīmējumu saraksts
/ Docs: Typst dokumentācija.#footnote[https://typst.com/docs/]
/ Universe: Typst kopienas paketes un šabloni.#footnote[https://typst.app/universe/]

= Ievads
#lorem(80)

#set heading(numbering: "1.")
= Teorijas apraksts
#lorem(60) (skat. @table-1[pielikumu])

== Subheading 1
#lorem(30)

== Subheading 2
#lorem(30)

#set heading(numbering: none)
= Secinājumi
#lorem(100)

#bibliography-here()

= Pielikumi
#appendix(
  caption: "Appendix table",
  label: <table-1>,
)[
  #table(
    columns: (1fr, 2fr),
    table.header([Foo], [Bar]),
    lorem(10), lorem(20),
  )
]


#figure(
  kind: "appendix",
  supplement: "pielikums",
  caption: "Another table",
  table(
    columns: (1fr, 2fr),
    table.header([Foo], [Bar]),
    lorem(10), lorem(20),
  ),
)
