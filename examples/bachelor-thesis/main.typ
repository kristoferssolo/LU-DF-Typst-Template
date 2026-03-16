#import "@preview/solo-lu-df:1.1.2": *

#show: ludf.with(
  title: "Bakalaura Darba Nosaukums",
  thesis-type: "bachelor",
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
  date: datetime(
    year: 2025,
    month: 1,
    day: 1,
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
  attachments: (
    attachment(
      caption: "Attachment table",
      label: <table-1>,
      table(
        columns: (1fr, 1fr),
        [foo], [bar],
      ),
    ),
    attachment(
      caption: "Another table",
      table(
        columns: (1fr, 1fr),
        [Column 1], [Column 2],
      ),
    ),
  ),
)


= Ievads
#lorem(100)

= Teorētiskais pamatojums
#lorem(80)

== Teorijas apraksts
#lorem(60)

= Prakse
#lorem(80)

== Risinājuma apraksts
#lorem(60)

= Rezultāti
#lorem(50)

= Secinājumi
#lorem(30)
