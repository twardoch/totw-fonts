# Use `poppler` tools to split and rename paragraph samples made by Monotype Font Explorer X
## Latin
mkdir -p totw-para-latn; cd totw-para-latn; pdfseparate ../totw-para-latn.pdf totw-para-latn-%d.pdf; ls -1 *.pdf | while read p; do mv "$p" "$(pdftotext "$p" /dev/stdout | grep -e "PostScript Name" | sed "s/PostScript Name //g").pdf"; done; cd ..;
## Cyrillic
mkdir -p totw-para-cyrl; cd totw-para-cyrl; pdfseparate ../totw-para-cyrl.pdf totw-para-cyrl-%d.pdf; ls -1 *.pdf | while read p; do mv "$p" "$(pdftotext "$p" /dev/stdout | grep -e "PostScript Name" | sed "s/PostScript Name //g").pdf"; done; cd ..;
## Greek
mkdir -p totw-para-grek; cd totw-para-grek; pdfseparate ../totw-para-grek.pdf totw-para-grek-%d.pdf; ls -1 *.pdf | while read p; do mv "$p" "$(pdftotext "$p" /dev/stdout | grep -e "PostScript Name" | sed "s/PostScript Name //g").pdf"; done; cd ..;


# Use `hb-view` and `otfinfo` to generate headlines, tiles and loremipsums from fonts
## Heads
mkdir -p totw-heads; cd totw-fonts; ls -1 *.?tf | while read p; do hb-view --background=ffffff00 --margin=4 --features="+kern" --font-size=400 --font-file="$p" --output-file="../totw-heads/$(echo "$p" | sed "s/\..*//g").pdf" --text="$(otfinfo --family "$p")"; done; cd ..;
## Tiles
mkdir -p totw-tiles; cd totw-fonts; ls -1 *.?tf | while read p; do hb-view --background=ffffff00 --margin=4 --features="+kern" --font-size=200 --font-file="$p" --output-file="../totw-tiles/$(echo "$p" | sed "s/\..*//g").pdf" --text="Aa"; done; cd ..;
## Loremipsums
mkdir -p totw-lorem; cd totw-fonts; ls -1 *.?tf | while read p; do hb-view --background=ffffff00 --margin=4 --features="+kern" --font-size=50 --font-file="$p" --output-file="../totw-lorem/$(echo "$p" | sed "s/\..*//g").pdf" --text="Lorem ipsum dolor sit amet"; done; cd ..;
## adges
mkdir -p totw-adges; cd totw-fonts; ls -1 *.?tf | while read p; do hb-view --background=ffffff00 --margin=4 --features="+kern" --font-size=200 --font-file="$p" --output-file="../totw-adges/$(echo "$p" | sed "s/\..*//g").pdf" --text="adges"; done; cd ..;
## Small Heads
mkdir -p totw-smheads; cd totw-fonts; ls -1 *.?tf | while read p; do hb-view --background=ffffff00 --margin=4 --features="+kern" --font-size=40 --font-file="$p" --output-file="../totw-smheads/$(echo "$p" | sed "s/\..*//g").pdf" --text="$(otfinfo --family "$p")"; done; cd ..;
