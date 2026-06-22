# job-hunting — Générateur de CV et lettre de motivation (FR, Typst)

Un dépôt **réutilisable** pour transformer une offre d'emploi en **CV** et
**lettre de motivation** sur mesure (en français, sortie PDF via Typst), et
garder une trace de chaque candidature.

Il est conçu pour être piloté par un assistant (Claude Code) qui lit votre
profil, analyse l'offre et remplit les modèles — mais il s'utilise aussi très
bien à la main.

> 📄 **Standards français + compatibilité ATS** : voir
> [`docs/standards-cv-lettre-fr.md`](docs/standards-cv-lettre-fr.md). Le thème de
> CV est **single-column ATS-safe** (lisible par l'humain *et* parsable par les
> logiciels de recrutement). La lettre suit le format FR standard (Vous / Moi /
> Nous).

## Pour démarrer (n'importe qui)

1. **Créez votre profil** à partir de l'exemple fourni :
   ```bash
   cp information/profil.example.md information/profil.md
   ```
   Puis remplacez tout le contenu de `information/profil.md` par vos vraies
   informations (coordonnées, expériences, formations, compétences, projets…).
   C'est l'**unique source de vérité**.
2. **Ajoutez votre photo** (optionnelle) en `information/images.jpeg`, ou retirez
   le bloc photo dans `template/cv.typ`.
3. Installez Typst (voir ci-dessous) et générez vos PDF.

> 🔒 **Vos données restent locales.** `information/profil.md` et
> `information/images.jpeg` sont **git-ignorés** : ils ne sont jamais committés ni
> publiés. Seul l'exemple `information/profil.example.md` est versionné. Aucune
> donnée personnelle n'est codée en dur ailleurs — forkez et le dépôt est à vous.

## Arborescence

```
information/profil.example.md   # modèle de profil (versionné) — à copier
information/profil.md           # VOTRE profil (git-ignoré, source de vérité)
information/images.jpeg          # VOTRE photo (git-ignorée, optionnelle)
docs/standards-cv-lettre-fr.md   # standards FR + ATS
template/cv.typ                  # modèle CV à copier et remplir
template/lettre.typ              # modèle lettre à copier et remplir
build.sh                         # compile une candidature en PDF
candidatures/<entreprise>-<poste>-<date>/   # une candidature = un dossier (git-ignoré)
  offre.md  cv.typ  lettre.typ  cv.pdf  lettre.pdf
```

## Installer Typst (Linux / Ubuntu)

```bash
sudo snap install typst
```

## Générer les PDF d'une candidature

Copiez les modèles dans un dossier de candidature, remplissez-les, puis :

```bash
./build.sh candidatures/<entreprise>-<poste>-<date>
# -> cv.pdf, lettre.pdf à côté des .typ
```

`build.sh` utilise `typst compile --root .` pour que la photo
(`/information/images.jpeg`) se résolve depuis la racine du dépôt. Les PDF sont
ignorés par git (`*.pdf`).

## Avec Claude Code

Donnez simplement une offre d'emploi à l'assistant : il crée le dossier de
candidature, analyse l'offre, fait correspondre vos compétences, remplit le CV et
la lettre, puis construit les PDF. Le déroulé complet et les règles sont décrits
dans [`CLAUDE.md`](CLAUDE.md).
