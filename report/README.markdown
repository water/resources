## Snabbguide till skriva latex för rapporten

Jag har delat upp varje kapitel och delkapitel i var sin fil så att vi ska
kunna jobba parallelt utan att få mergekonflikter sedan. Och så är de mer
strukturerat.

Arbetat vi ska göra består av att kopiera saker från GDocs till latexfilerna, i
de flesta fall är det bara att kopiera över all text och göra om till riktiga
rubriker.

### Relevant latexsyntax

Ni bör veta om

    % kommentarer i latex
    \chapter{Rubrik 1}
    \section{Rubrik 2}
    \subsection{Rubrik 3}
    \subsubsection{Rubrik 4}
    \paragraph{Rubrik 5}
    \subparagraph{Rubrik 6}

Ifall ni ska jobba med bilder eller tabeller så kolla upp nå exempel online.

För referenser finns de nå smart system i latex som heter bibtex, men jag har
ingen aning hur det funkar, så tveksamt om vi hinner orda ihop med det.

### Installera latex

Via `apt-get` och liknande, det kommer alltid att behövas att dra ner massa
extrapaket för att få latex att funka i praktiken. tex
`texlive-fonts-recommended` och `texlive-fonts-extra`.

### Använda latex

    pdflatex main.tex

Sen ifall den i slutet säger att den skrev till `main.pdf` så kan ni öppna den med er pdfläsare.

## Kollaboreringen

Jag tänker mig att varje person i rummet tar var sitt kapitel, öppnar
mostvarande fil (försök förstå mappstrukturen i `include/`) och klistrar in
texten, ordnar rubrikerna och eventuella matteformler och så kollar ni att det
ser bra ut i dokumentet.

