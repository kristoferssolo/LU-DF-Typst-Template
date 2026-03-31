# solo-lu-df

A Typst template to write qualification papers, bachelor’s theses, and master’s
theses for Latvijas Universitāte (Faculty of Exact Sciences, Computer Science).
The package provides university-compliant layout rules, helpers for
title/abstract/appendices, and a ready-to-edit example.

## Usage

Use the template in the Typst web app by clicking "Start from template" and
searching for `solo-lu-df`, or initialize a new project with the CLI:

```sh
typst init @preview/solo-lu-df
```

Typst will create a new directory with the files needed to get started.

## Configuration

This template exports the `ludf` function which accepts named arguments to
configure the whole document, `references-start()` marker and `appendix` helper
function. Important arguments:

- `title`: Document title (content).
- `authors`: Array of author dictionaries. Each author must have `name` and
  `code` and may include `location` and `email`.
- `advisors`: Array of advisor dictionaries with `title` and `name`.
- `reviewer`: Reviewer dictionary with `name`.
- `thesis-type`: Type of thesis - `"bachelor"`, `"master"`, `"course"`, or `"qualification"`. The documentary page adapts its content based on this value.
- `date`: `datetime(...)` value for the thesis date. Defaults to `today`.
- `place`: Place string (e.g., `"Rīga"`).
- `abstract`: A record with `primary` and `secondary` abstracts. Each has
  `text` (content) and `keywords` (array) as well as `title`, `lang` and `keyword-title`.
- `bibliography`: Result of `bibliography("path/to/file.yml")` or `none`. Place `#references-start()` in the body where the references section should appear.
- `outline-title`: Title for the table of contents. Defaults to `"Saturs"`.
- `display-documentary`: Whether to display the documentary page at the end. Defaults to `true`.
- `description`: Document description for PDF metadata. Defaults to `none`.
- Positional argument: the document body follows the `ludf.with(...)` call.

**Note:** The template automatically extracts keywords from both `primary` and `secondary` abstracts and sets them as PDF document metadata.

The function also accepts a single, positional argument for the body of the paper.

The template will initialize your package with a sample call to the `ludf`
function in a show rule. If you want to change an existing project to use this
template, you can add a show rule like this at the top of your file:

```typst
#import "@preview/solo-lu-df:2.0.0": *

#show: ludf.with(
  title: "Darba Nosaukums",
  authors: (
    (name: "Jānis Bērziņš", code: "jb12345", email: "jb12345@edu.lu.lv"),
  ),
  advisors: (
    (title: "Mg. dat.", name: "Ivars Ozoliņš"),
  ),
  reviewer: (title: "", name: "Prof. Anna Liepa"),
  date: datetime(year: 2025, month: 1, day: 1),
  place: "Rīga",
  bibliography: bibliography("bibliography.yml"),
  abstract: (
    primary: (text: [ Anotācijas teksts... ], keywords: ("Foo", "Bar")),
    secondary: (text: [ Abstract text... ], keywords: ("Foo", "Bar")),
  ),
)

// Your content goes here.

#references-start()

#heading(level: 1, "Pielikumi")
#appendix(
  caption: "Attachment table",
  label: <table-1>,
)[
  #table(
    columns: (1fr, 1fr),
    [Column 1], [Column 2],
  )
]
```

If you use `bibliography`, place `#references-start()` exactly once.

## Examples

Ready-to-edit examples for different thesis types are included:

- **Qualification thesis**: [`examples/qualification-thesis/`](https://github.com/kristoferssolo/LU-DF-Typst-Template/tree/v2.0.0/examples/qualification-thesis)
- **Course work**: [`examples/course-work/`](https://github.com/kristoferssolo/LU-DF-Typst-Template/tree/v2.0.0/examples/course-work)
- **Bachelor thesis**: [`examples/bachelor-thesis/`](https://github.com/kristoferssolo/LU-DF-Typst-Template/tree/v2.0.0/examples/bachelor-thesis)
- **Master thesis**: [`examples/master-thesis/`](https://github.com/kristoferssolo/LU-DF-Typst-Template/tree/v2.0.0/examples/master-thesis)

Browse all examples on GitHub: <https://github.com/kristoferssolo/LU-DF-Typst-Template/tree/v2.0.0/examples>

The qualification thesis example contains `main.typ`, `bibliography.yml` and small helpers under
`utils/`. Use it as a starting point or copy it into a new project.

## Tips

- Install the fonts used by the template (Times family, JetBrains Mono) to
  reproduce exact layout, or change font names in `src/lib.typ`. You can
  override font by setting [text font](https://typst.app/docs/reference/text/text#parameters-font) to your desired one.
- Bibliography: use Typst's `bibliography(...)` call with a YAML or Bib file.
- Diagrams: the example imports the fletcher package and includes small
  helpers under `examples/.../utils/`, but you can also use exported
    images from draw.io (diagrams.net) or any other diagram editor.

## License

This project is licensed under the MIT-0 License - see the [LICENSE](./LICENSE) file for details.
