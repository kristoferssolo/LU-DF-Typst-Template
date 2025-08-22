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
    #par(first-line-indent: 0cm)[ *#abs.keyword-title*: ]
    #abs.keywords.join(", ").
  ]
}
