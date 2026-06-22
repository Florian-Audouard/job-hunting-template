#!/usr/bin/env bash
# update.sh — met à jour le framework (pipeline CV/lettre) depuis le template.
#
# Tire les améliorations du dépôt template (remote "upstream") dans votre copie,
# puis pousse le résultat sur votre dépôt privé (remote "origin").
# Vos données personnelles (information/profil.md, information/images.jpeg,
# candidatures/) ne sont JAMAIS touchées : le template ne suit pas ces chemins.
#
# Usage : ./update.sh
set -euo pipefail
cd "$(dirname "$0")"

branch="$(git branch --show-current)"

# 1) Garde-fou : refuser de tourner avec des modifications non committées.
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "✖ Modifications non committées. Committez ou stash avant de mettre à jour." >&2
  git status --short
  exit 1
fi

# 2) Le remote upstream (le template) doit exister.
if ! git remote get-url upstream >/dev/null 2>&1; then
  echo "✖ Remote 'upstream' introuvable. Ajoutez-le une fois :" >&2
  echo "    git remote add upstream <url-du-template>" >&2
  exit 1
fi

echo "→ Récupération des mises à jour du framework (upstream/$branch)…"
git fetch --quiet upstream

# 3) Rien à faire si on est déjà à jour.
if git merge-base --is-ancestor "upstream/$branch" HEAD; then
  echo "✓ Déjà à jour — rien à tirer."
  exit 0
fi

# 4) Fusionner les changements du template.
if git merge --no-edit "upstream/$branch"; then
  echo "✓ Framework mis à jour."
else
  echo "✖ Conflit pendant la fusion (inhabituel : vos données ne sont pas suivies" >&2
  echo "  par le template). Résolvez les conflits puis lancez : git commit" >&2
  exit 1
fi

# 5) Sauvegarder sur le dépôt privé si origin existe.
if git remote get-url origin >/dev/null 2>&1; then
  echo "→ Envoi vers votre dépôt privé (origin/$branch)…"
  git push origin "$branch"
  echo "✓ Copie privée sauvegardée."
else
  echo "ℹ Pas de remote 'origin' : mise à jour locale uniquement."
fi
