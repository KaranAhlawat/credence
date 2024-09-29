(lang dune 3.16)

(name credence)

(generate_opam_files true)

(source
 (github KaranAhlawat/passeport))

(authors "Karan Ahlawat" "theteachr")

(maintainers "Karan Ahlawat")

(license MIT)

(package
 (name credence)
 (synopsis "A library for Dream authentication")
 (description "An authentication middleware for Dream web framework, with pluggable authentication strategies.")
 (depends
   ocaml
   dune
   dream
   (ocaml-lsp-server :with-dev-setup)
   (ocamlformat :with-dev-setup)))
