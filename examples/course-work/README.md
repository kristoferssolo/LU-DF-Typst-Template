Course work example (solo-lu-df)

This folder contains a ready-to-edit course work example built with
the `solo-lu-df` Typst template:

- `main.typ` – Typst source (the example document).
- `bibliography.yml` – example bibliography entries (create as needed).

## How to edit

Open `examples/course-work/main.typ` and modify the `ludf.with(...)`
call to change title, authors, advisors, submission date, defense date, place,
abstract, and bibliography. Place `#bibliography-here()` where the references
section should appear. The example demonstrates:

- Title/author/advisor metadata
- Primary and secondary abstracts with keywords
- Explicit bibliography placement with `#bibliography-here()`
- Appendices written directly in the document body

## Thesis type

This example uses `thesis-type: "course"` which generates the appropriate
documentary page for course works.

## License

This project is licensed under the MIT-0 License – see the [LICENSE](./../../LICENSE) file for details.
