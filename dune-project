(lang dune 3.7)

(name test-ocaml-assgn)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name <author@example.com>")

(maintainers "Maintainer Name <maintainer@example.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name test-ocaml-assgn)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml ppx_expect ppx_sexp_conv sexplib0)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
