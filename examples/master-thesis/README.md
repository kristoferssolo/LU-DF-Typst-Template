Master thesis example (solo-lu-df)

This folder contains a ready-to-edit master thesis example built with
the `solo-lu-df` Typst template:

- `main.typ` – Typst source (the example document).
- `bibliography.yml` – example bibliography entries (create as needed).

## How to edit

Open `examples/master-thesis/main.typ` and modify the `ludf.with(...)`
call to change title, authors, advisors, reviewer, submission date, defense
date, place, abstract, and bibliography. Place `#references-start()` where the
references section should appear. The example demonstrates:

- Title/author/advisor metadata
- Multiple advisors for master thesis
- Reviewer for master thesis
- Primary and secondary abstracts with keywords
- Explicit bibliography placement with `#references-start()`
- Appendices written directly in the document body

## Thesis type

This example uses `thesis-type: "master"` which generates the appropriate
documentary page for master theses (similar to bachelor, but with "maģistra"
instead of "bakalaura" in the footer).

## License

This project is licensed under the MIT-0 License – see the [LICENSE](./../../LICENSE) file for details.
