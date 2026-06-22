// Lettre de motivation — exemple Typst
// Build : typst compile lettre.typ  (génère lettre.pdf)

#set document(title: "Lettre de motivation — Camille Dupont")
#set page(paper: "a4", margin: (x: 2.2cm, y: 2cm))
#set text(font: "Liberation Sans", size: 11pt, lang: "fr")
#set par(justify: true, leading: 0.8em)

// Expéditeur
#text[
  Camille Dupont \
  12 rue de la République \
  69001 Lyon \
  06 12 34 56 78 \
  camille.dupont\@example.com
]

#v(1em)

// Destinataire
#align(right)[
  #text[
    Acme Corp \
    Service Recrutement \
    1 avenue des Champs \
    69002 Lyon
  ]
]

#v(1em)
#align(right)[Lyon, le 22 juin 2026]
#v(1em)

*Objet : Candidature au poste de Développeuse Full-Stack*

#v(1em)
Madame, Monsieur,

#v(0.5em)
Votre approche centrée produit et votre exigence technique, illustrées par la
qualité de vos solutions, correspondent précisément à l'environnement dans lequel
je souhaite évoluer. C'est pourquoi votre offre de Développeuse Full-Stack a
immédiatement retenu mon attention.

Au cours de mes cinq années d'expérience, j'ai conçu et fait évoluer des
applications web utilisées par des dizaines de milliers d'utilisateurs (React,
Node.js, PostgreSQL), en améliorant sensiblement leurs performances. L'encadrement
de développeurs juniors et la mise en place de revues de code m'ont également
appris à transmettre et à fédérer autour d'exigences de qualité.

Rejoindre votre équipe me permettrait de mettre ces compétences au service de vos
projets tout en relevant de nouveaux défis techniques. Je serais ravie d'échanger
avec vous, lors d'un entretien, sur ce que je peux concrètement vous apporter.

#v(0.5em)
Je vous prie d'agréer, Madame, Monsieur, l'expression de mes salutations
distinguées.

#v(1.5em)
#align(right)[Camille Dupont]
