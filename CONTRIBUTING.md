# Contributing to solo-lu-df

Thanks for helping improve `solo-lu-df`. This project is a Typst template for
University of Latvia Faculty of Exact Sciences computer science papers, so small
fixes to wording, examples, layout, and documentation are useful.

Contributions can include:

- Fixing Typst layout bugs.
- Improving examples.
- Updating documentation.
- Adding or fixing locale labels.
- Improving diagrams or assets.

## Before you start

For larger changes or behavior changes, open an issue first and describe the
problem you want to solve. This is especially useful for changes that affect the
template API, generated document layout, or existing user projects.

Keep changes focused. A small documentation fix, an example update, and a layout
change should usually be separate pull requests.

## Development setup

Install Typst before working on the template. The package metadata in
`typst.toml` requires Typst `0.14.0`; use that version or a newer compatible
version.

This repository uses a `justfile` for local checks. There are no package-manager
scripts required for normal template work.

## Making changes

Follow the existing structure and style:

- Keep Typst source consistent with nearby files.
- Prefer clear, minimal changes over broad rewrites.
- Update examples when public usage changes.
- Keep shell examples in fenced `bash` code blocks.

When changing `src/locale.typ`, make sure new or updated labels fit the existing
nested label structure and are documented where users need to override them.

## Validation

Run the relevant examples before opening a pull request. For broad layout,
template, or documentation changes, compile all included entry points:

```bash
just check
```

The `check` recipe runs:

```bash
typst compile template/main.typ
typst compile examples/qualification-thesis/main.typ
typst compile examples/course-work/main.typ
typst compile examples/bachelor-thesis/main.typ
typst compile examples/master-thesis/main.typ
```

Inspect generated PDFs when the change affects layout, figures, tables,
appendices, title pages, documentary pages, or bibliography placement.

If a change is intentionally limited to one example or one documentation page,
say which commands you ran in the pull request.

## Reporting issues

Open an issue for bugs, layout regressions, missing functionality, unclear
documentation, or feature requests.

Include:

- Typst version.
- `solo-lu-df` package or template version, when relevant.
- Affected file, example, or template area.
- Steps to reproduce, including commands and file paths.
- Expected behavior.
- Actual behavior.
- Screenshot or PDF snippet for layout issues, when helpful.

## Pull requests

In the pull request description, include:

- What changed.
- Why it changed.
- Which template areas or examples are affected.
- Which validation commands you ran.
- Screenshots or PDF snippets for visual changes, when helpful.
- Migration notes if the change affects existing users.

## Documentation changes

Keep documentation and examples aligned with the actual template behavior.

- Update `README.md` when public usage changes.
- Update example README files when an example changes.
- Update usage snippets when `ludf.with(...)` arguments or helper functions
  change.
- Update the README migration notes when a change requires users to adjust
  existing documents.

## License

Contributions are provided under the project MIT-0 license. See
[LICENSE](./LICENSE) for the full license text.
