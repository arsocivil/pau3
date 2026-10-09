#!/bin/bash
# Instal·la TeX Live a les sessions de Claude Code al núvol perquè
# pistes/build.py pugui compilar les pistes (pistes/src/*.tex -> data/*-p.pdf).
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Ja instal·lat? (pdflatex + català + paquets de pista.sty + fonts cm-super)
if command -v pdflatex >/dev/null 2>&1 \
   && kpsewhich catalan.ldf mdframed.sty titlesec.sty fancyhdr.sty eurosym.sty sfrm1095.pfb >/dev/null 2>&1 \
   && command -v pdftoppm >/dev/null 2>&1 && command -v qpdf >/dev/null 2>&1; then
  echo "TeX Live ja és disponible."
  exit 0
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq --no-install-recommends \
  texlive-latex-base texlive-latex-recommended texlive-latex-extra \
  texlive-lang-european texlive-lang-spanish texlive-fonts-recommended \
  cm-super latexmk qpdf poppler-utils > /dev/null

echo "TeX Live instal·lat: $(pdflatex --version | head -1)"
