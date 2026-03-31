Qualification thesis example (solo-lu-df)

This folder contains a ready-to-edit qualification-thesis example built with
the `solo-lu-df` Typst template:

- `main.typ` – Typst source (the example document).
- `bibliography.yml` – example bibliography entries.
- `utils/` – helper snippets for diagrams/tables used by the example.

## How to edit

Open `examples/qualification-thesis/main.typ` and modify the `ludf.with(...)`
call to change title, authors, advisors, submission date, defense date, place,
abstract, and bibliography. Place `#references-start()` where the references
section should appear. The example demonstrates:

- Title/author/advisor metadata
- Primary and secondary abstracts with keywords
- Explicit bibliography placement with `#references-start()`
- Appendices (tables) written directly in the document body
- Simple DPD/ER diagrams via `fletcher` or external images and local helpers

## Thesis type

This example uses `thesis-type: "qualification"` which generates the appropriate
documentary page for qualification theses.

## License

This project is licensed under the MIT-0 License – see the [LICENSE](./../../LICENSE) file for details.
