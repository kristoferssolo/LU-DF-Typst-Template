#import "@preview/solo-lu-df:0.0.1": ludf

#show: ludf.with(
  title: "Darba Nosaukums",
  authors: (
    (
      name: "Jānis Bērziņš",
      code: "jb12345",
      location: [Riga, Latvia],
      email: "jb12345@edu.lu.lv",
    ),
    (
      name: "Zane Kalniņa",
      code: "zk67890",
      location: [Riga, Latvia],
      email: "zk67890@edu.lu.lv",
    ),
  ),
  advisors: (
    (
      title: "Mg. dat.",
      name: "Ivars Ozoliņš",
    ),
  ),
  date: (
    year: 2025,
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
#lorem(100)@typst

#set heading(numbering: "1.1.")

= Nodaļas nosaukums
== Apakšnodaļas nosaukums
== Apakšnodaļas nosaukums
== Apakšnodaļas nosaukums

= Nodaļas nosaukums
== Apakšnodaļas nosaukums
== Apakšnodaļas nosaukums

= Nodaļas nosaukums
== Apakšnodaļas nosaukums
== Apakšnodaļas nosaukums

#set heading(numbering: none)
= Rezultāti
= Secinājumi

