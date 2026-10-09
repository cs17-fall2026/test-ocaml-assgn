FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# System dependencies for opam and building OCaml packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    opam build-essential m4 pkg-config unzip rsync git curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

USER vscode

# Sandboxing (bubblewrap) doesn't work in unprivileged containers, so disable it
RUN opam init -y --bare --disable-sandboxing && \
    opam switch create cs17 ocaml-base-compiler.5.3.0 && \
    opam install -y --switch=cs17 \
    dune ocaml-lsp-server utop odoc ocamlformat \
    ppx_expect ppx_inline_test ppx_sexp_conv && \
    opam clean -a -c -s --logs

# Make the switch active in terminals (bash and zsh)
RUN echo 'eval $(opam env --switch=cs17 --set-switch)' >> ~/.bashrc && \
    echo 'eval $(opam env --switch=cs17 --set-switch)' >> ~/.zshrc

# Smoke test: fail the build if any tool is missing
RUN opam exec --switch=cs17 -- dune --version && \
    opam exec --switch=cs17 -- ocamllsp --version && \
    opam exec --switch=cs17 -- ocamlformat --version && \
    opam exec --switch=cs17 -- odoc --version && \
    opam exec --switch=cs17 -- ocamlfind query ppx_sexp_conv ppx_expect