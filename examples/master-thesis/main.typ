#import "@preview/solo-lu-df:2.0.0": *

#show: ludf.with(
  title: "Maģistra Darba Nosaukums",
  thesis-type: "master",
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
      title: "Dr. phys.",
      name: "Ivars Ozoliņš",
    ),
    (
      title: "Mg. dat.",
      name: "Anna Zariņa",
    ),
  ),
  reviewer: (
    title: "Prof. Dr. Phys.",
    name: "Anna Liepa",
  ),
  submission-date: datetime(
    year: 2025,
    month: 6,
    day: 15,
  ),
  defense-date: datetime(
    year: 2025,
    month: 6,
    day: 30,
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

= Ievads
#lorem(120)

#set heading(numbering: "1.")
= Teorētiskais pamatojums
#lorem(100)

== Pamatjēdzieni
#lorem(80)

== Līdzīgie risinājumi
#lorem(60)

= Izstrāde
#lorem(100)

== Arhitektūra
#lorem(80)

== Implementācija
#lorem(60)

= Testēšana
#lorem(80)

#set heading(numbering: none)
= Rezultāti un analīze
#lorem(100)

= Secinājumi
#lorem(40)

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
  caption: "Another table",
  table(
    columns: (1fr, 2fr),
    table.header([Foo], [Bar]),
    lorem(10), lorem(20),
  ),
)
