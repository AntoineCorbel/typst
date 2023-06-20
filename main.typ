#import "template.typ": *
#import "typst-boxes.typ": *
#import "info-box.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Semi-conducteur HPGe, diverses informations",
  authors: (
    (name: "Name Last_name", email: "blabla.blabla@blabla.com"),
  ),
  date: "16 juin 2023",
)
#set math.equation(numbering: "(1)")
#set heading(numbering: "1.")

//==================================================================
// Typing MirionLogo will show the logo in the pdf
#show "Logo": name => box[
  #box(image(
    "Logo.png",
    width: 1em,
  ))
  #name // to show the name after the logo, can be disabled.
]

#let GD(body) = {
  set text(fill: red)
  [
  *GD:* #body
]
}
#let MM(body) = {
  set text(fill: orange)
  [
  *MM:* #body
]
}

// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

= Introduction
Je vais dans cet article parler des différentes propriétés du HPGe, mais plus globalement des semi-conducteurs. En effet, leurs propriétés sont clés dans la spectrométrie gamma, que ce soit en physique nucléaire ou bien en physique des hautes énergies.

== Création d'un cristal de germanium
#figure(
  image("hpge_growth.svg", width: 60%),
  caption: [Processus de création d'un cristal HPGe à partir de germanium liquide @HPGeGrowth]
) <fig:HPGe>

On utilise pour créer un cristal pur, un petit morceau de cristal dont l'axe $<100>$ du réseau cristallin est orienté comme on le souhaite. On vient plonger ce morceau dans le germanium liquide, puis le retirer très lentement ($~ "mm/h"$). A son contact, le germanium liquide va se solidifier, formant une tige dont le réseau cristallin suit la même orientation que le _Seed Cristal_ visible en @fig:HPGe[Fig.]

== Le fonctionnement des semi-conducteurs
Il est important de passer par cette étape pour bien comprendre comment les semi-conducteurs sont utiles à la physique, et bien plus.

Un semi-conducteur est un matériau qui peut avoir des les propriétés d'un conducteur électrique, ou bien d'un isolant, et ce en fonction de sa température. _Mais comment cela fonctionne ?_ Il s'agit en fait de la structure atomique du matériau directement qui lui apporte ces propriétés.
Pour illustrer un peu ces mots, on peut se référer à la figure @bandes ci-dessous.
#figure(
  image("SCBandes.jpg", width: 50%),
  caption: [Structure en bandes d'un semi-conducteur @MaxicoursBandes]
) <bandes>

== Le dopage
Cette méthode consiste à ajouter des impuretés dans le matériau dans le but de modifier ses propriétés de conductivité. Par exemple, le HPGe utilisé pour AGATA est de type N.
Voici une rapide description des types de dopage existant.

+ #underline[Le type N]
  - Il consiste à ajouter dans le semi-conducteur des atomes donneurs d'électrons. Ces derniers vont ainsi augmenter la densité électronique du matériau, le rendant plus *négativement chargé*. (@dopages, schéma de gauche)
+ #underline[Le type P]
  - A l'inverse, ce dernier consiste à ajouter des atomes receveurs d'électrons dans le semi-conducteur. Les impuretés captureront alors des électrons, laissant une densité de trous plus importante, trous *chargés positivement*. (@dopages, schéma de droite)

  Il est également possible de réaliser les deux types de dopage simultanément, cela ayant pour but d'augmenter encore plus la conductivité du semi-conducteur.

#figure(
  grid(
    columns: 2,
    column-gutter: 1mm,
    image("N-doped_Si.png", width: 70%),
    image("P-doped_Si.png", width: 70%),
  ),
  caption: [Représentation d'un réseau cristallin dopé de type N (gauche) et de type P (droite). L'électron que l'on voit libre à gauche étant très peu lié aux atomes, il pourra facilement passer vers la bande de conduction, d'où une conductivité accrue dans le semi-conducteur @dopageWikipedia]
) <dopages>

== Jonction PN
Il s'agit d'une zone du cristal dans laquelle le dopage varie brusquement, passant d'un dopage p à un dopage n. Lorsque la jonction p est mise en contact avec la région n, les électrons et les trous diffusent spontanément de part et d'autre de la jonction, créant ainsi *une zone de déplétion* @Bonnaud2006 (également appelée zone de charge d'espace (ZCE)). La jonction ne laisse quasiment pas passer le courant. La largeur de la zone de déplétion varie avec la tension appliquée de part et d'autre de la jonction @jonctionpnWikipedia.

Cette zone de déplétion ne comporte plus de charges libres, car les paires électron/trou se sont recombinées suite à la diffusion évoquée dans le paragraphe précédent.

== Pourquoi AGATA a des HPGe de type N et pas P ?
Pour la collaboration AGATA, les détecteurs sont faits en germanium ultra-pur (HPGe). Ces derniers sont de type N. Les détecteurs AGATA étant des coaxiaux, on peut calculer le rayon $R_c$ tel que pour l'aire intérieure $cal(A)_("int")$, on ait $cal(A)_("int") = cal(A)_("tot") / 2 = cal(A)_("ext")$ avec $cal(A)_("tot")$ l'aire totale de notre coax pris en vue du haut et $cal(A)_("ext")$ l'aire extérieure, entre $R_c$ et  $R_("tot")$.

#figure(
  image("coax.png", width: 50%),
  caption: [
    Représentation schématique d'un détecteur coaxial vu du dessus, avec deux cercles concentriques d'aires $cal(A)_("int")$ et $cal(A)_("ext")$ égales.
  ],
) <coax>

On peut effectuer un rapide calcul en prenant l'hypothèse d'un coax sans trou central, juste pour avoir une idée approximative de la valeur de $R_c$ par rapport à $R_("tot")$:


On veut $ R_c "tel que" cal(A)_("int") = cal(A)_("ext") = cal(A)_("tot") / 2 = (pi R_("tot")^2) / 2 $
Or $ cal(A)_("int") = pi R_c^2 $
On a donc l'égalité $ cal(A)_("int") = cal(A)_("tot") / 2 <==> pi R_c^2 = (pi R_("tot")^2) / 2 $
D'où  $ R_c = R_("tot") / sqrt(2) $

/*Pour $R_("tot") = 8 "cm"$, cela donne $R_c = 5.65 "cm"$, soit 70 % de $R_("tot")$ à l'intérieur de $R_c$ et 30 % de $R_("tot")$ à l'extérieur de $R_c$.*/

#colorbox(
  title: "'Rayon d'équilibre' pour un détecteur coaxial",
  color: "red",
  radius: 1pt,
  width: auto
)[
 Pour un détecteur coaxial dont on néglige le trou central, le rayon $R_c$ pour lequel il y a autant de surface à l'intérieur qu'à l'extérieur du cercle de rayon $R_c$ est
 $ R_c = R_("tot") / sqrt(2) approx 0.707 dot R_("tot") $
 avec $R_("tot")$ le rayon total du détecteur coaxial. La distance entre le centre du détecteur et $R_c$ est donc $approx 2.3$ fois plus importante que la distance $abs(R_c - R_("tot"))$
]

Les interactions ayant en moyenne lieu à $R = R_c$, si l'on prend en considération que les trous ont une plus grande probabilité de se faire piéger suite à des dommages neutroniques, il faut limiter au plus leur parcours lors de la collecte des charges, ce qui revient à les collecter sur les bords extérieurs du coax. C'est la raison pour laquelle on a mis sur le trou central un contact (+), créant un champ électrique $arrow(E)$, dirigé vers la terre. 

Les électrons vont alors remonter ce champ électrique, et les trous le suivre. *Leur parcours moyen sera donc plus faible que celui des électrons, limitant au maximum leur piégeage.* Pour donner un ordre de grandeur, les détecteurs de type P sont environ 10 fois plus sensibles aux dommages neutrons que les types N (#text(blue, "info Gilbert")).

#bibliography("bibliography.bib")
