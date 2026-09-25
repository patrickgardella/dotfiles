# docs

## Cheat sheet

- `cheatsheet-print.html` — source for the printable cheat sheet (tmux, Neovim, Hyprland), laid out to fit one US Letter page.
- `cheatsheet.pdf` — generated PDF, ready to print.

Regenerate the PDF after editing the HTML:

```sh
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu --no-pdf-header-footer --print-to-pdf=docs/cheatsheet.pdf --print-to-pdf-no-header "file://$(pwd)/docs/cheatsheet-print.html"
```

Run from the repo root (`~/projects/dotfiles`).
