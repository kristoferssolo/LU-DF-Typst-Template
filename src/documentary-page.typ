#let signature-line(length: 6em) = box(
  width: length,
  stroke: (bottom: 0.5pt),
  height: 0.65em,
)

#let fmt-date(date) = strong(date.display("[day].[month].[year]."))

#let thesis-config(labels) = (
  bachelor: (
    label: labels.thesis_label_bachelor,
    intro-suffix: labels.documentary_intro_suffix_bachelor,
    make-footer: (submission-date, defense-date) => [
      #labels.documentary_submitted_line #submission-date \
      #labels.documentary_authorized_person_label ~#signature-line()

      #v(1fr)

      #labels.documentary_defense_line_bachelor ~#signature-line() \
      #defense-date #labels.documentary_protocol_label #signature-line(
        length: 4em,
      ) \
      #labels.documentary_committee_secretary_label #signature-line(
        length: 15em,
      )
    ],
  ),
  master: (
    label: labels.thesis_label_master,
    intro-suffix: labels.documentary_intro_suffix_master,
    make-footer: (submission-date, defense-date) => [
      #labels.documentary_submitted_line #submission-date \
      #labels.documentary_authorized_person_label ~#signature-line()

      #v(1fr)

      #labels.documentary_defense_line_master ~#signature-line() \
      #defense-date #labels.documentary_protocol_label #signature-line(
        length: 4em,
      ) \
      #labels.documentary_committee_secretary_label #signature-line(
        length: 15em,
      )
    ],
  ),
  course: (
    label: labels.thesis_label_course,
    intro-suffix: labels.documentary_intro_suffix_course,
    make-footer: (submission-date, _) => [
      #labels.documentary_submitted_line #submission-date \
      #labels.documentary_course_footer
    ],
  ),
  qualification: (
    label: labels.thesis_label_qualification,
    intro-suffix: labels.documentary_intro_suffix_qualification,
    make-footer: (submission-date, _) => [
      #labels.documentary_submitted_line #submission-date \
      #labels.documentary_qualification_footer
    ],
  ),
)

#let get-thesis-label(thesis-type, labels) = (
  thesis-config(labels)
    .at(thesis-type, default: (
      label: str(thesis-type),
    ))
    .label
)

#let get-thesis-config(thesis-type, labels) = {
  thesis-config(labels).at(thesis-type, default: (
    label: str(thesis-type),
    intro-suffix: "",
    make-footer: (submission-date, _) => [],
  ))
}

#let make-author-lines(authors, submission-date, labels) = {
  if authors.len() > 1 [
    #labels.documentary_authors_plural:\
  ] else [
    #labels.documentary_authors_singular:
  ]
  authors
    .map(it => [*#it.name, #it.code* ~#signature-line()~ #submission-date])
    .join("\n")
}

#let make-advisor-lines(advisors, submission-date, labels) = {
  if advisors.len() > 0 [
    #if advisors.len() > 1 [
      #labels.documentary_advisors_plural:\
    ] else [
      #labels.documentary_advisors_singular:
    ]
    #(
      advisors
        .map(it => [*#it.title #it.name* ~#signature-line()~ #submission-date])
        .join("\n")
    )
  ]
}

#let make-dokumentary(
  title,
  authors,
  advisors,
  reviewer,
  thesis-type,
  submission-date,
  defense-date,
  labels,
) = {
  let cfg = get-thesis-config(thesis-type, labels)

  [
    #cfg.label "*#title*" #labels.documentary_developed_at
    #labels.documentary_faculty_name.

    #labels.documentary_declaration#cfg.intro-suffix.
    #set par(hanging-indent: 1cm)

    #v(0.2fr)

    #make-author-lines(authors, submission-date, labels)

    #v(1fr)

    #labels.documentary_recommendation\
    #make-advisor-lines(advisors, submission-date, labels)

    #v(1fr)

    #if reviewer != none [
      #labels.documentary_reviewer_label: *#reviewer.title  #reviewer.name*
      #v(1fr)
    ]

    #(cfg.make-footer)(submission-date, defense-date)

    #v(1fr)
  ]
}

#let normalize-title(title) = {
  if type(title) != content or "children" not in title.fields() {
    return title
  }

  let children = title
    .fields()
    .children
    .filter(it => it.func() != linebreak)
    .fold((), (acc, it) => {
      if it == [ ] and (acc.len() == 0 or acc.last() == [ ]) {
        acc
      } else {
        acc + (it,)
      }
    })

  let children = if children.len() > 0 and children.last() == [ ] {
    children.slice(0, -1)
  } else {
    children
  }

  children.join("")
}

#let make-documentary-page(
  title,
  authors,
  advisors,
  reviewer,
  thesis-type,
  submission-date,
  defense-date,
  labels,
) = {
  set page(numbering: none)
  set par(spacing: 2em)
  heading(
    level: 1,
    outlined: false,
    numbering: none,
    labels.documentary_page_title,
  )

  make-dokumentary(
    normalize-title(title),
    authors,
    advisors,
    reviewer,
    thesis-type,
    fmt-date(submission-date),
    fmt-date(defense-date),
    labels,
  )
}
