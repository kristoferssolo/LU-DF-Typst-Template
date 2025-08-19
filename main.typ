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

== Links
Here is a #link("https://typst.app")[Typst website].

== Table
Here’s a simple table:

#figure(
  table(
    columns: 3,
    table.header[Name][Age][Role],
    "Alice", "24", "Engineer",
    "Bob", "30", "Designer",
    "Carol", "28", "Researcher",
  ),
  caption: [Example table],
)


== Figures
#figure(
  image("example.png", width: 60%),
  caption: [An example image with caption.],
)

== Footnotes
This is a sentence with a footnote. #footnote("This is the footnote text.")

== References
We can reference @typst in text.


