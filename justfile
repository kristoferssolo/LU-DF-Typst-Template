alias c := check
alias t := template
alias b := bump

# Show available recipes
[group("help")]
default:
    just --list

# Bump package version references. Usage: just bump 2.2.0
[group("dev")]
bump version:
    @case "{{version}}" in [0-9]*.[0-9]*.[0-9]*) ;; *) echo "version must look like 2.2.0"; exit 1;; esac
    @old="$(sed -n 's/^version = "\([^"]*\)"/\1/p' typst.toml)"; old_pattern="$(printf '%s\n' "$old" | sed 's/\./\\./g')"; sed -i -E "s/version = \"$old_pattern\"/version = \"{{version}}\"/g; s/@preview\\/solo-lu-df:$old_pattern/@preview\\/solo-lu-df:{{version}}/g; s#(github.com/kristoferssolo/LU-DF-Typst-Template/(tree|blob)/)v$old_pattern#\\1v{{version}}#g" typst.toml README.md template/main.typ examples/*/main.typ

# Compile every template and example entry point
[group("dev")]
check: template qualification course bachelor master

# Generate the package thumbnail from the template cover page
[group("assets")]
thumbnail:
    typst compile -f png --pages 1 --ppi 250 template/main.typ thumbnail.png

# Compile the package template entry point
[group("compile")]
template:
    typst compile template/main.typ

# Compile the qualification thesis example
[group("compile")]
qualification:
    typst compile examples/qualification-thesis/main.typ

# Compile the course work example
[group("compile")]
course:
    typst compile examples/course-work/main.typ

# Compile the bachelor thesis example
[group("compile")]
bachelor:
    typst compile examples/bachelor-thesis/main.typ

# Compile the master thesis example
[group("compile")]
master:
    typst compile examples/master-thesis/main.typ
