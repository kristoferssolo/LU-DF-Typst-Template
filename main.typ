#import "template.typ": ludf
#show: ludf.with(
  authors: (
    (
      name: "John Doe",
      code: "jd00000",
      location: [Riga, Latvia],
      email: "jd00000@edu.lu.lv",
    ),
  ),
  advisors: (
    (
      title: "Mg. dat.",
      name: "Jone Doe",
    ),
  ),
  date: "2025",
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

= Document Title

== Headings
This is a paragraph of body text. It should show how normal text looks.

=== Subheading
Another paragraph with _emphasis_, *strong text*, and `inline code`.

== Lists

=== Unordered
- Item one
- Item two
  - Nested item
  - Another nested item
- Item three

=== Ordered
+ First
  + Sub A
    + Sub i
+ Second
+ Third

== Math
Inline math: $e^(i pi) + 1 = 0$.

Block math:
$
  lim_(-oo)^(infinity) e^(-x^2) d x = sqrt(pi)
$ <math-1>


And we can reference @math-1.

== Code
Here is some code:

```rust
fn main() {
    println!("Hello, Typst!");
}
```

== Quotes
#quote[This is a blockquote.]

They can span multiple lines.

#quote(attribution: [Plato])[
  ... ἔοικα γοῦν τούτου γε σμικρῷ τινι αὐτῷ τούτῳ σοφώτερος εἶναι, ὅτι
  ἃ μὴ οἶδα οὐδὲ οἴομαι εἰδέναι.
]

#quote(attribution: [from the Henry Cary literal translation of 1897])[
  ... I seem, then, in just this little thing to be wiser than this man at
  any rate, that what I do not know I do not think I know either.
]

== Links <title>
Here is a https://typst.app and
here is a with a label -- #link("https://typst.app")[Typst website].

== Table
Here’s a simple table:

#figure(
  table(
    columns: 4,
    table.header[Name][Age][Role][Lorem],
    "Alice", "24", "Engineer", lorem(8),
    "Bob", "30", "Designer", lorem(8),
    "Carol", "28", "Researcher", lorem(7),
  ),
  caption: [Example table],
) <table-1>


== Figures
#figure(
  image("example.png", width: 60%),
  caption: [An example image with caption.],
) <image-1>
#figure(
  image("example.png"),
  caption: [An example image with caption.],
) <image-2>

- @image-1[]
- @image-2
- @table-1
- @table-1[tabulu]
- @title
- @code[pielikumu]

A reference to an image (see @image-1[] and @image-2 and @table-1)


== Footnotes
This is a sentence with a footnote. #footnote("This is the footnote text.")

== References
// We can reference @typst in text.


#figure(
  caption: "Some caption",
  kind: "attachment",
  supplement: "pielikums",
  ```rust
  #[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
  #[cfg_attr(feature = "bevy_reflect", derive(bevy_reflect::Reflect))]
  #[cfg_attr(feature = "bevy", derive(Component))]
  #[cfg_attr(feature = "bevy", reflect(Component))]
  #[derive(Debug, Clone, Copy, PartialEq, Eq)]
  pub struct Walls(u8);
  ```,
)<code>

