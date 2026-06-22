#!/usr/bin/env bash
# Compile le CV et la lettre d'une candidature en PDF.
# Usage : ./build.sh candidatures/<entreprise>-<poste>-<date>
# Prérequis : typst (sudo snap install typst)
set -euo pipefail
cd "$(dirname "$0")"
dir="${1:?usage: ./build.sh candidatures/<dossier>}"
# --root . : la photo /information/images.jpeg se résout depuis la racine du dépôt.
typst compile --root . "$dir/cv.typ"
typst compile --root . "$dir/lettre.typ"
echo "OK -> $dir/cv.pdf, $dir/lettre.pdf"
