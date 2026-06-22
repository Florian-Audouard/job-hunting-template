#!/usr/bin/env bash
# init.sh — transforme un clone du template en votre copie privée de travail.
#
# À lancer UNE FOIS, juste après avoir cloné le dépôt template :
#     git clone <url-du-template> mon-job-hunting
#     cd mon-job-hunting
#     ./init.sh [url-de-votre-depot-prive]
#
# Le script :
#   - renomme le remote du template "origin" -> "upstream" (utilisé par ./update.sh) ;
#   - ajoute votre dépôt privé comme "origin" (si l'URL est fournie) ;
#   - bascule sur la branche "main" et règle la stratégie de pull (fusion) ;
#   - crée information/profil.md à partir de l'exemple.
# Idempotent : peut être relancé sans danger.
set -euo pipefail
cd "$(dirname "$0")"

private_url="${1:-}"

# 1) Remote du template -> upstream.
if git remote get-url upstream >/dev/null 2>&1; then
  echo "ℹ upstream déjà configuré : $(git remote get-url upstream)"
elif git remote get-url origin >/dev/null 2>&1; then
  git remote rename origin upstream
  echo "→ remote du template renommé : origin -> upstream"
else
  echo "✖ Aucun remote trouvé. Clonez d'abord le dépôt template, puis relancez." >&2
  exit 1
fi

# 2) Votre dépôt privé -> origin.
if [ -n "$private_url" ]; then
  if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$private_url"
  else
    git remote add origin "$private_url"
  fi
  echo "→ origin (votre dépôt privé) : $private_url"
else
  echo "ℹ Aucune URL privée fournie. Ajoutez-la plus tard avec :"
  echo "      git remote add origin <url-de-votre-depot-prive>"
fi

# 3) Branche main + stratégie de pull (fusion, pas de prompt à chaque update).
if [ "$(git branch --show-current)" = "master" ]; then
  git branch -m master main
  echo "→ branche renommée : master -> main"
fi
git config pull.rebase false

# 4) Profil personnel à partir de l'exemple (sans écraser un profil existant).
if [ -e information/profil.md ]; then
  echo "ℹ information/profil.md existe déjà — laissé intact."
else
  cp information/profil.example.md information/profil.md
  echo "→ information/profil.md créé depuis l'exemple."
fi

cat <<'EOF'

✓ Initialisation terminée.

Prochaines étapes :
  1. Renseignez information/profil.md avec vos vraies informations.
  2. (Optionnel) ajoutez votre photo en information/images.jpeg
  3. Versionnez-les dans votre dépôt privé (forcer : ils sont git-ignorés) :
       git add -f information/profil.md information/images.jpeg
       git commit -m "Mon profil"
       git push -u origin main
  4. Plus tard, pour récupérer les améliorations du framework :
       ./update.sh
EOF
