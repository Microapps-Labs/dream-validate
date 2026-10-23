# Local output capture

Captured on 2026-10-23 from base source revision `e2442e079a6e9cd349ef3c4bad9b8944738b5f89`, with the example and copy changes in this commit.

OCaml 5.3.0, Dune 3.22.2. Four runtime and nine PPX tests passed. Dream and dream-pure were pinned to the same cohttp-eio fork checkout at 2186e044967ab24444ba9b5b5c692350a871b36f. The example decodes local field lists, not HTTP traffic.

The PNG is a browser-rendered transcript of the output saved in output.txt, not a fabricated application UI. Run the included OCaml example with `opam exec -- dune exec examples/demo/main.exe` after setting up the dependencies described in the root README. No credentials or client data appear in the capture.
