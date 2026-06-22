// CV — exemple Typst (thème single-column ATS-safe)
// Build : typst compile cv.typ  (génère cv.pdf)

#let accent = rgb("#1a4f8a")

#set document(title: "CV — Camille Dupont", author: "Camille Dupont")
#set page(paper: "a4", margin: (x: 1.8cm, top: 1.4cm, bottom: 1.4cm))
#set text(font: "Liberation Sans", size: 10pt, lang: "fr")
#set par(leading: 0.62em)

// Titres de section : majuscules, accent, filet
#show heading.where(level: 2): it => block(above: 1.0em, below: 0.55em)[
  #set text(size: 10.5pt, weight: "bold", fill: accent)
  #upper(it.body)
  #v(-0.35em)
  #line(length: 100%, stroke: 0.6pt + accent)
]

// Ligne d'entrée : intitulé (gras) à gauche, dates (italique) à droite
#let entree(titre, lieu, dates) = block(above: 0.8em, below: 0.35em)[
  #grid(columns: (1fr, auto),
    [*#titre* — #lieu],
    text(style: "italic", fill: rgb("#555"))[#dates])
]

// ---- En-tête ----
// Photo à gauche (décorative), infos en texte sélectionnable à droite → ATS-safe.
#block[
  #grid(columns: (auto, 1fr), column-gutter: 1.1em, align: horizon,
    box(clip: true, radius: 50%, width: 2.6cm, height: 2.6cm,
      image("/information/images.jpeg", width: 100%, height: 100%, fit: "cover")),
    [
      #text(size: 23pt, weight: "bold")[Camille Dupont]
      #v(-0.2em)
      #text(size: 12pt, fill: accent, weight: "medium")[Développeuse Full-Stack]
      #v(0.15em)
      #text(size: 9pt, fill: rgb("#333"))[
        Lyon, France #h(0.4em)·#h(0.4em) 06 12 34 56 78 #h(0.4em)·#h(0.4em) camille.dupont\@example.com \
        github.com/camilledupont #h(0.4em)·#h(0.4em) linkedin.com/in/camilledupont
      ]
    ])
]
#v(0.2em)
#line(length: 100%, stroke: 1pt + accent)

== Profil
Développeuse full-stack avec 5 ans d'expérience dans la conception
d'applications web performantes. Spécialisée en JavaScript/TypeScript, React et
Node.js. À la recherche d'un poste alliant exigence technique et impact produit.

== Compétences
- *Langages* : JavaScript, TypeScript, Python, SQL
- *Front* : React, Vue.js, HTML/CSS, Tailwind
- *Back* : Node.js, Express, Symfony, PostgreSQL
- *Outils* : Git, Docker, CI/CD, Linux

== Expériences professionnelles
#entree("Développeuse Full-Stack senior", "Acme Corp, Lyon", "2022 — présent")
- Conception et développement d'une plateforme SaaS (React, Node.js, PostgreSQL) utilisée par 20 000 utilisateurs.
- Réduction de 40 % du temps de chargement via optimisation du rendu et mise en cache.
- Encadrement de 2 développeurs juniors et mise en place de revues de code.

#entree("Développeuse web", "Studio Web, Lyon", "2019 — 2022")
- Développement de sites vitrines et e-commerce (Vue.js, Symfony).
- Intégration d'API de paiement et mise en place de tests automatisés.

== Formation
#entree("Master Informatique", "Université Claude Bernard Lyon 1", "2019")
#entree("Licence Informatique", "Université Lyon 1", "2017")

== Langues
- Français — langue maternelle
- Anglais — courant (C1)
- Espagnol — notions (A2)
