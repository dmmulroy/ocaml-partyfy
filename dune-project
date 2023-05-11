(lang dune 3.7)

(name ocaml_partyfy)

(generate_opam_files true)

(source
 (github dmmulroy/ocaml_partyfy))

(authors "Dillon Mulroy")

(maintainers "Dillon Mulroy")

(license MIT)

(documentation https://github.com/dmmulroy/ocaml_partyfy)

(package
 (name ocaml_partyfy)
 (synopsis "An OCaml library for generating rainbow party gifs")
 (description "An OCaml library for generating rainbow party gifs")
 (depends ocaml dune base bimage bimage-unix stdio)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
