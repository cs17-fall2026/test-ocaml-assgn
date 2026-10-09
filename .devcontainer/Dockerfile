# Pilot version: once validated, pin this image to a specific digest.
FROM ghcr.io/tarides/ocaml-devcontainer:latest

USER vscode

# The parent image already includes OCaml, Dune, LSP, utop, and ppx_expect.
# Install the additional dependencies listed in the CS17 local guide.
RUN opam switch ocaml && \
    opam install -y odoc ocamlformat ppx_sexp_conv && \
    opam list --installed --short | grep -E '^(odoc|ocamlformat|ppx_sexp_conv)$'
