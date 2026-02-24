#let signature-line(length: 6em) = box(
  width: length,
  stroke: (bottom: 0.5pt),
  height: 0.65em,
)

#let bachelor-dokumentary(
  title,
  authors,
  advisors,
  reviewer,
  date,
  presentation-date,
) = [
  Bakalaura darbs "*#title*" izstrādāts Latvijas Universitātes Eksakto zinātņu un
  tehnoloģiju fakultātē.

  Ar savu parakstu apliecinu, ka darbs izstrādāts patstāvīgi, izmantoti tikai
  tajā norādītie informācijas avoti un iesniegtā darba elektroniskā kopija
  atbilst izdrukai.
  #set par(hanging-indent: 1cm)

  #v(0.2fr)

  #if authors.len() > 1 { [Autori:\ ] } else { "Autors: " }
  #(
    authors
      .map(author => [*#author.name, #author.code*  ~#signature-line()~ #date])
      .join(", ")
  )

  #v(1fr)
  Rekomendēju/nerekomendēju darbu aizstāvēšanai _(nederīgo svītro vadītājs)_\
  #if advisors.len() > 0 [
    #if advisors.len() > 1 { [Vadītāji:\ ] } else { "Vadītājs:" }
    #(
      advisors
        .map(
          advisor => [*#advisor.title #advisor.name* ~#signature-line()~ #date],
        )
        .join("\n")
    )
  ]

  #v(1fr)

  #if reviewer != none {
    [Recenzents: *#reviewer.title  #reviewer.name*]
    v(1fr)
  }


  Darbs iesniegts Datorikas nodaļā #date \
  Pilnvarotā persona: vecākā metodiķe: Ārija Sproģe ~#signature-line()

  #v(1fr)

  Darbs aizstāvēts bakalaura gala pārbaudījuma komisijas sēdē ~#signature-line() \
  #presentation-date prot. Nr. #signature-line(length: 4em) \
  Komisijas sekretārs(-e): #signature-line(length: 15em)

  #v(1fr)
]

#let fmt-date(date) = {
  strong(date.display("[day].[month].[year]."))
}

#let course-work-dokumentary = []

#let qualification-work-dokumentary = []

#let make-documentary-page(
  title,
  authors,
  advisors,
  reviewer,
  thesis-type,
  date,
  presentation-date,
) = {
  set page(numbering: none)
  heading(level: 1, outlined: false, numbering: none, "Dokumentārā lapa")
  set par(spacing: 2em)
  let formatted-date = fmt-date(date)
  let formatted-presentation-date = fmt-date(presentation-date)

  if thesis-type == "bachelor" {
    bachelor-dokumentary(
      title,
      authors,
      advisors,
      reviewer,
      formatted-date,
      formatted-presentation-date,
    )
  }
}
