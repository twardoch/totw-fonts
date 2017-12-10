#!/usr/bin/env bash

dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir";

fd="$dir/../../fonts"; # Target folder for fonts

# General fetch functions

ghurl_repozip () { # Gets URL for a given Github 'user/repo' master repo ZIP
	echo "https://github.com/$1/archive/master.zip";
}

ghurl_relzipball () { # Gets URL for a given Github 'user/repo' latest release ZIP ball
	echo "$(curl -s "https://api.github.com/repos/$1/releases/latest" | jq -r '.zipball_url')";
}

ghurl_assetzipbyname () { # Gets URL for a given Github 'user/repo' latest release asset with 'name'
	echo "$(curl -s "https://api.github.com/repos/$1/releases/latest" | jq -r '.assets[] | select(.name | contains("'$2'")) | .browser_download_url')";
}

dlzip () {
	local url="$1";
	rm -rf tmp;
	mkdir -p tmp;
	cd tmp;
	curl -s -o dl.zip -L "$url";
	unzip -qq -o dl.zip;
	rm -f dl.zip;
	local unzipdir="$(ls -1 -d */ 2>/dev/null)";
	cd ..;
	echo $unzipdir;
}

dlghfolder () {
	local url="$1";
	rm -rf tmp;
	mkdir -p tmp;
	cd tmp;
	svn -q export "$url";
	cd ..;
}

# Font-specific fetch functions

<<<<<<< HEAD
    otf_Aileron () {
    r="ssagano/Aileron";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Alegreya () {
    r="huertatipografica/Alegreya-libre";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_AlegreyaSans () {
    r="huertatipografica/Alegreya-Sans";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Bevan () {
    r="googlefonts/BevanFont";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Bitter () {
    r="solmatas/Bitter";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Coelacanth () {
    r="Fuzzypeg/Coelacanth";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    mv tmp/$d./Coelac*.otf "$td";
    mv tmp/$d./interpolatedFonts/Coelac*.otf "$td";
}

otf_Cormorant () {
    r="CatharsisFonts/Cormorant";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./2. OpenType Files/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Crimson () {
    r="skosch/Crimson";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./Desktop Fonts/OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_EBGaramond () {
    # Special: merges Octavio Pardo's expansion with the original Georg Duffner project 	
    r="georgd/EBGaramond";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip 'octaviopardo/EBGaramond12'))";
    find "tmp/$d./Fonts/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
    local url="https://bitbucket.org/georgd/eb-garamond/downloads/EBGaramond-0.016.zip";
    # Hardcoded! 	
    d="$(dlzip $url)";
    find "tmp/$d./otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_EauDeGaramond () {
    r="CatharsisFonts/EauDeGaramond";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./2. OpenType Font Files/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Eczar () {
    r="rosettatype/eczar";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Fira () {
    r="carrois/Fira";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Kalam () {
    r="itfoundry/kalam";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./build/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_LibreCaslonDisplay () {
    r="impallari/Libre-Caslon-Display";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_LibreCaslonText () {
    r="impallari/Libre-Caslon-Text";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_LibreClarendon () {
    r="impallari/Libre-Clarendon";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/" -type f -iname 'LibreClarendon*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_LibreFranklin () {
    r="impallari/Libre-Franklin";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_LinguisticsPro () {
    r="StefanPeev/Linguistics-Pro";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(curl -s "https://api.github.com/repos/$r/releases/tags/LingusticsPro" | jq -r '.zipball_url'))";
    find "tmp/$d" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Montserrat () {
    r="JulietaUla/Montserrat";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_OldStandard () {
    r="alexeiva/oldstand";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Oswald () {
    r="googlefonts/OswaldFont";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Pecita () {
    r="pecita/pecita";
    echo $r;
    rm -rf tmp;
    mkdir -p tmp;
    cd tmp;
    curl -s -o Pecita.otf -L "http://pecita.eu/b/Pecita.otf";
    cd ..;
    td="$1/$r/";
    mkdir -p "$td";
    mv -f "tmp/Pecita.otf" "$td";
}

otf_PlayfairDisplay () {
    r="clauseggers/Playfair-Display";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    mv tmp/$d./fonts/CFF/*.otf "$td";
}

otf_RokkittFont () {
    r="googlefonts/RokkittFont";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Rubik () {
    r="googlefonts/rubik";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_STIX2 () {
    r="stixfonts/STIX2";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    local url="https://sourceforge.net/projects/stixfonts/files/latest/download";
    d="$(dlzip $url)";
    find "tmp/$d./Fonts/OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Sahitya () {
    r="huertatipografica/sahitya";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./otf/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Sansita () {
    r="Omnibus-Type/Sansita";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./Fonts/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_SourceCodePro () {
    r="adobe-fonts/source-code-pro";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_relzipball $r))";
    find "tmp/$d./OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_SourceSansPro () {
    r="adobe-fonts/source-sans-pro";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_relzipball $r))";
    find "tmp/$d./OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_SourceSerifPro () {
    r="adobe-fonts/source-serif-pro";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_relzipball $r))";
    find "tmp/$d./OTF/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Theano () {
    r="akryukov/theano";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='otf.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_Veleka () {
    r="StefanPeev/Veleka";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./Fonts/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

otf_WorkSans () {
    r="weiweihuanghuang/Work-Sans";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/desktop/" -type f -iname '*.otf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Allura () {
    r="typesetit/allura";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/allura";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/allura" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Almendra () {
    r="anasanfelippo/almendra";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/almendra";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/almendra" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/almendrasc";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/almendrasc" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/almendradisplay";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/almendradisplay" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Archivo () {
    r="Omnibus-Type/Archivo";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_ArchivoBlack () {
    r="Omnibus-Type/ArchivoBlack";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_ArchivoNarrow () {
    r="Omnibus-Type/ArchivoNarrow";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_CharisSIL () {
    r="sil/CharisSIL";
    echo $r;
    local url="http://software.sil.org/downloads/r/charis/CharisSIL-5.000.zip";
    # Hardcoded! 	
    d="$(dlzip $url)";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Chivo () {
    r="Omnibus-Type/Chivo";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Cinzel () {
    r="ndiscovered/cinzel";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/cinzel";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/cinzel" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/cinzeldecorative";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/cinzeldecorative" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Dynalight () {
    r="astigmatic/dynalight";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/dynalight";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/dynalight" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_EncodeSans () {
    r="impallari/Encode-Sans";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Faustina () {
    r="m4rc1e/faustina";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Fruktur () {
    r="EbenSorkin/Fruktur";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_GreatVibes () {
    r="typesetit/greatvibes";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/greatvibes";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/greatvibes" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_IBMPlex () { 
    r="IBM/type";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Iosevka () {
    r="be5invis/Iosevka";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='01-';
    # Check for future releases 	
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    assetname='05-';
    # Check for future releases 	
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_JimNightshade () {
    r="astigmatic/jimnightshade";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/jimnightshade";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/jimnightshade" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Kavoon () {
    r="EbenSorkin/Kavoon";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Lato () {
    r="typoland/Lato";
    echo $r;
    local url="http://www.latofonts.com/download/Lato2OFL.zip";
    # Hardcoded! 	
    d="$(dlzip $url)";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_LibreBaskerville () {
    r="impallari/Libre-Baskerville";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Manuale () {
    r="m4rc1e/manuale";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Marcellus () {
    r="astigmatic/marcellus";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/marcellus";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/marcellus" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/marcellussc";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/marcellussc" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Modak () {
    r="EkType/Modak";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Mononoki () {
    r="madmalik/mononoki";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_MonsieurLaDoulaise () {
    r="sudtipos/monsieurladoulaise";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/monsieurladoulaise";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/monsieurladoulaise" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Mukta () {
    r="EkType/Mukta";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Noto () {
    r="googlei18n/noto-fonts";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./unhinted/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    find "tmp/$d./hinted/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    r="googlei18n/noto-fonts-alpha";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./from-pipeline/unhinted/ttf/sans/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    find "tmp/$d./from-pipeline/unhinted/ttf/serif/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    find "$td" -type f -name '*UI-*.ttf' | while read p;
    do rm "$p";
    done;
}

ttf_PTMono () {
    r="paratype/PTMono";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip https://www.paratype.com/uni/public/PTMono.zip)";
    mv tmp/*.ttf "$td";
}

ttf_PTSans () {
    r="paratype/PTSans";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip https://www.paratype.com/uni/public/PTSans.zip)";
    mv tmp/*.ttf "$td";
}

ttf_PTSerif () {
    r="paratype/PTSerif";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip https://www.paratype.com/uni/public/PTSerif.zip)";
    mv tmp/*.ttf "$td";
}

ttf_PirataOne () {
    r="rfuenzalida/pirataone";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/pirataone";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/pirataone" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_ProzaLibre () {
    r="jasperdewaard/Proza-Libre";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Raleway () {
    r="alexeiva/Raleway";
    # Possibly later change to 'impallari/Raleway' 	
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d./fonts/TTF/" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Roboto () {
    r="google/roboto";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    assetname='hinted.zip';
    d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
    find "tmp" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_RobotoMono () {
    r="google/robotomono";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/apache/robotomono";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/robotomono" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Sansation () {
    r="berndmontag/sansation";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/sansation";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/sansation" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Ubuntu () {
    r="ubuntu/ubuntu";
    echo $r;
    local url="https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip";
    # Hardcoded! 	
    d="$(dlzip $url)";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/$d" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Unifraktur () {
    r="googlefonts/unifraktur";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/unifrakturcook";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/unifrakturcook" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/unifrakturmaguntia";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/unifrakturmaguntia" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Vampiro () {
    r="EbenSorkin/Vampiro";
    echo $r;
    td="$1/$r/";
    mkdir -p "$td";
    d="$(dlzip $(ghurl_repozip $r))";
    find "tmp/$d" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Wellfleet () {
    r="EbenSorkin/wellfleet";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/wellfleet";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/wellfleet" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}

ttf_Yesteryear () {
    r="astigmatic/yesteryear";
    echo $r;
    dlghfolder "https://github.com/google/fonts/trunk/ofl/yesteryear";
    td="$1/$r/";
    mkdir -p "$td";
    find "tmp/yesteryear" -type f -iname '*.ttf' | while read p;
    do mv -f "$p" "$td";
    done;
}


=======
ttf_Noto () { 
	r="googlei18n/noto-fonts"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./unhinted/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	find "tmp/$d./hinted/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	find "tmp/$d./alpha/from-pipeline/unhinted/ttf/sans/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	find "tmp/$d./alpha/from-pipeline/unhinted/ttf/serif/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done;
	find "$td" -type f -name '*UI-*.ttf' | while read p; do rm "$p"; done; 
} 

ttf_Lato () { 
	r="typoland/Lato";
	echo $r;
	local url="http://www.latofonts.com/download/Lato2OFL.zip"; # Hardcoded!
	d="$(dlzip $url)";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_PTSans () { 
	r="paratype/PTSans";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip https://www.paratype.com/uni/public/PTSans.zip)";
	mv tmp/*.ttf "$td";
} 

ttf_PTSerif () { 
	r="paratype/PTSerif";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip https://www.paratype.com/uni/public/PTSerif.zip)";
	mv tmp/*.ttf "$td";
} 

ttf_PTMono () { 
	r="paratype/PTMono";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip https://www.paratype.com/uni/public/PTMono.zip)";
	mv tmp/*.ttf "$td";
} 

otf_PlayfairDisplay () { 
	r="clauseggers/Playfair-Display";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	mv tmp/$d./CFF/*.otf "$td";
} 

otf_Coelacanth () {
	r="Fuzzypeg/Coelacanth";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	mv tmp/$d./Coelac*.otf "$td";
	mv tmp/$d./interpolatedFonts/Coelac*.otf "$td";
}

otf_OldStandard () { 
	r="alexeiva/oldstand";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Theano () { 
	r="akryukov/theano";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='otf.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Cormorant () { 
	r="CatharsisFonts/Cormorant";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./2. OpenType Files/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_LibreCaslonText () { 
	r="impallari/Libre-Caslon-Text";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_LibreCaslonDisplay () { 
	r="impallari/Libre-Caslon-Display";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_LibreClarendon () { 
	r="impallari/Libre-Clarendon";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/" -type f -iname 'LibreClarendon*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_ProzaLibre () { 
	r="jasperdewaard/Proza-Libre";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_LibreBaskerville () { 
	r="impallari/Libre-Baskerville";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

otf_SourceSerifPro () { 
	r="adobe-fonts/source-serif-pro";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_relzipball $r))";
	find "tmp/$d./OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_LinguisticsPro () {
	r="StefanPeev/Linguistics-Pro";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(curl -s "https://api.github.com/repos/$r/releases/tags/LingusticsPro" | jq -r '.zipball_url'))";
	find "tmp/$d" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
}

otf_Alegreya () { 
	r="huertatipografica/Alegreya-libre";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Sahitya () { 
	r="huertatipografica/sahitya";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Veleka () { 
	r="StefanPeev/Veleka";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./Fonts/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_CharisSIL () { 
	r="sil/CharisSIL";
	echo $r;
	local url="http://software.sil.org/downloads/r/charis/CharisSIL-5.000.zip"; # Hardcoded!
	d="$(dlzip $url)";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Crimson () { 
	r="skosch/Crimson";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./Desktop Fonts/OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_STIX2 () { 
	r="stixfonts/STIX2";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	local url="https://sourceforge.net/projects/stixfonts/files/latest/download"; 
	d="$(dlzip $url)";
	find "tmp/$d./Fonts/OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_EBGaramond () { # Special: merges Octavio Pardo's expansion with the original Georg Duffner project
	r="georgd/EBGaramond";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip 'octaviopardo/EBGaramond12'))";
	find "tmp/$d./Fonts/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
	local url="https://bitbucket.org/georgd/eb-garamond/downloads/EBGaramond-0.016.zip"; # Hardcoded!
	d="$(dlzip $url)";
	find "tmp/$d./otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Rubik () { 
	r="googlefonts/rubik";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Roboto () {
	r="google/roboto";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='hinted.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

otf_WorkSans () { 
	r="weiweihuanghuang/Work-Sans";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/desktop/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Fira () { 
	r="carrois/Fira";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_EauDeGaramond () { 
	r="CatharsisFonts/EauDeGaramond";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./2. OpenType Font Files/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_EncodeSans () { 
	r="impallari/Encode-Sans";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

ttf_Raleway () { 
	r="alexeiva/Raleway"; # Possibly later change to 'impallari/Raleway'
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/TTF/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

otf_LibreFranklin () { 
	r="impallari/Libre-Franklin";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_AlegreyaSans () { 
	r="huertatipografica/Alegreya-Sans";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_SourceSansPro () { 
	r="adobe-fonts/source-sans-pro";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_relzipball $r))";
	find "tmp/$d./OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Aileron () { 
	r="ssagano/Aileron";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Ubuntu () { 
	r="ubuntu/ubuntu";
	echo $r;
	local url="http://font.ubuntu.com/download/ubuntu-font-family-0.83.zip"; # Hardcoded!
	d="$(dlzip $url)";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/$d" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Montserrat () { 
	r="brawer/Montserrat"; # possibly later change to 'JulietaUla/Montserrat'
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Oswald () { 
	r="googlefonts/OswaldFont"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Chivo () { 
	r="Omnibus-Type/Chivo"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Archivo () { 
	r="m4rc1e/archivo"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Faustina () { 
	r="m4rc1e/faustina";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Manuale () { 
	r="m4rc1e/manuale";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_ArchivoNarrow () { 
	r="Omnibus-Type/ArchivoNarrow"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_ArchivoBlack () { 
	r="Omnibus-Type/ArchivoBlack"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./Fonts/" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Bevan () { 
	r="googlefonts/BevanFont"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_RokkittFont () { 
	r="googlefonts/RokkittFont"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_SourceCodePro () { 
	r="adobe-fonts/source-code-pro";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_relzipball $r))";
	find "tmp/$d./OTF/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Mononoki () { 
	r="madmalik/mononoki";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

ttf_Iosevka () { 
	r="be5invis/Iosevka";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='01-'; # Check for future releases
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	assetname='05-'; # Check for future releases
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

ttf_RobotoMono () { 
	r="google/robotomono";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/apache/robotomono";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/robotomono" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Yesteryear () { 
	r="astigmatic/yesteryear";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/yesteryear";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/yesteryear" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_JimNightshade () { 
	r="astigmatic/jimnightshade";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/jimnightshade";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/jimnightshade" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Kavoon () {
	r="EbenSorkin/Kavoon";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

ttf_Vampiro () {
	r="EbenSorkin/Vampiro";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

ttf_Fruktur () { 
	r="EbenSorkin/Fruktur";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Wellfleet () { 
	r="EbenSorkin/wellfleet";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/wellfleet";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/wellfleet" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Modak () { 
	r="EkType/Modak";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Mukta () { 
	r="EkType/Mukta";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_GreatVibes () { 
	r="typesetit/greatvibes";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/greatvibes";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/greatvibes" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Dynalight () { 
	r="astigmatic/dynalight";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/dynalight";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/dynalight" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Sansita () { 
	r="Omnibus-Type/Sansita"; 
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./Fonts/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Eczar () { 
	r="rosettatype/eczar";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	assetname='.zip'; 
	d="$(dlzip $(ghurl_assetzipbyname $r $assetname))";
	find "tmp" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Allura () { 
	r="typesetit/allura";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/allura";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/allura" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Almendra () {
	r="anasanfelippo/almendra";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/almendra";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/almendra" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	dlghfolder "https://github.com/google/fonts/trunk/ofl/almendrasc";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/almendrasc" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	dlghfolder "https://github.com/google/fonts/trunk/ofl/almendradisplay";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/almendradisplay" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

otf_Bitter () { 
	r="solmatas/Bitter";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./fonts/otf/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
}

ttf_Cinzel () {
	r="ndiscovered/cinzel";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/cinzel";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/cinzel" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	dlghfolder "https://github.com/google/fonts/trunk/ofl/cinzeldecorative";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/cinzeldecorative" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
}

ttf_MonsieurLaDoulaise () { 
	r="sudtipos/monsieurladoulaise";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/monsieurladoulaise";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/monsieurladoulaise" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Kalam () { 
	r="itfoundry/kalam";
	echo $r;
	td="$1/$r/"; mkdir -p "$td";
	d="$(dlzip $(ghurl_repozip $r))";
	find "tmp/$d./build/" -type f -iname '*.otf' | while read p; do mv "$p" "$td"; done; 
}

ttf_Marcellus () { 
	r="astigmatic/marcellus";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/marcellus";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/marcellus" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	dlghfolder "https://github.com/google/fonts/trunk/ofl/marcellussc";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/marcellussc" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_PirataOne () { 
	r="rfuenzalida/pirataone";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/pirataone";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/pirataone" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Sansation () { 
	r="berndmontag/sansation";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/sansation";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/sansation" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

ttf_Unifraktur () { 
	r="googlefonts/unifraktur";
	echo $r;
	dlghfolder "https://github.com/google/fonts/trunk/ofl/unifrakturcook";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/unifrakturcook" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
	dlghfolder "https://github.com/google/fonts/trunk/ofl/unifrakturmaguntia";
	td="$1/$r/"; mkdir -p "$td";
	find "tmp/unifrakturmaguntia" -type f -iname '*.ttf' | while read p; do mv "$p" "$td"; done; 
} 

otf_Pecita () { 
	r="pecita/pecita";
	echo $r;
	rm -rf tmp;
	mkdir -p tmp;
	cd tmp;
	curl -s -o Pecita.otf -L "http://pecita.eu/b/Pecita.otf";
	cd ..;
	td="$1/$r/"; mkdir -p "$td";
	mv "tmp/Pecita.otf" "$td"; 
}

>>>>>>> c5752dfa31f3eda3110c64e49c0de624e8d1a32b
# Aggregate fetch functions

all_ttf_ofl_noto () {
	local tb="$fd/ttf-ofl-noto";
	mkdir -p "$tb";
	ttf_Noto "$tb";
	rm -rf tmp;
} 

all_ttf_ufl () {
	local tb="$fd/ttf-ufl";
	mkdir -p "$tb";
	ttf_Ubuntu "$tb";
	rm -rf tmp;
}

all_ttf_apache2 () {
	local tb="$fd/ttf-apache2";
	mkdir -p "$tb";
	ttf_Roboto "$tb";
	ttf_RobotoMono "$tb";
	rm -rf tmp;
}

all_ttf_ofl () {
	local tb="$fd/ttf-ofl";
	mkdir -p "$tb";
	ttf_Allura "$tb";
	ttf_Almendra "$tb";
	ttf_Archivo "$tb";
	ttf_ArchivoBlack "$tb";
	ttf_ArchivoNarrow "$tb";
	ttf_CharisSIL "$tb";
	ttf_Chivo "$tb";
	ttf_Cinzel "$tb";
	ttf_Dynalight "$tb";
	ttf_EncodeSans "$tb";
	ttf_Faustina "$tb";
	ttf_Fruktur "$tb";
	ttf_GreatVibes "$tb";
<<<<<<< HEAD
	ttf_IBMPlex "$tb";
=======
>>>>>>> c5752dfa31f3eda3110c64e49c0de624e8d1a32b
	ttf_Iosevka "$tb";
	ttf_JimNightshade "$tb";
	ttf_Kavoon "$tb";
	ttf_Lato "$tb";
	ttf_LibreBaskerville "$tb";
	ttf_Manuale "$tb";
	ttf_Marcellus "$tb";
	ttf_Modak "$tb";
	ttf_Mononoki "$tb";
	ttf_MonsieurLaDoulaise "$tb";
	ttf_Mukta "$tb";
	ttf_PirataOne "$tb";
	ttf_ProzaLibre "$tb";
	ttf_PTMono "$tb";
	ttf_PTSans "$tb";
	ttf_PTSerif "$tb";
	ttf_Raleway "$tb";
	ttf_Sansation "$tb";
	ttf_Unifraktur "$tb";
	ttf_Vampiro "$tb";
	ttf_Wellfleet "$tb";
	ttf_Yesteryear "$tb";
	rm -rf tmp;
} 

all_otf_ofl () {
	local tb="$fd/otf-ofl";
	mkdir -p "$tb";
	otf_Aileron "$tb";
	otf_Alegreya "$tb";
	otf_AlegreyaSans "$tb";
	otf_Bevan "$tb";
	otf_Bitter "$tb";
	otf_Coelacanth "$tb";
	otf_Cormorant "$tb";
	otf_Crimson "$tb";
	otf_EauDeGaramond "$tb";
	otf_EBGaramond "$tb";
	otf_Eczar "$tb";
	otf_Fira "$tb";
	otf_Kalam "$tb";
	otf_LibreCaslonDisplay "$tb";
	otf_LibreCaslonText "$tb";
	otf_LibreClarendon "$tb";
	otf_LibreFranklin "$tb";
	otf_LinguisticsPro "$tb";
	otf_Montserrat "$tb";
	otf_OldStandard "$tb";
	otf_Oswald "$tb";
	otf_Pecita "$tb";
	otf_PlayfairDisplay "$tb";
	otf_RokkittFont "$tb";
	otf_Rubik "$tb";
	otf_Sahitya "$tb";
	otf_Sansita "$tb";
	otf_SourceCodePro "$tb";
	otf_SourceSansPro "$tb";
	otf_SourceSerifPro "$tb";
	otf_STIX2 "$tb";
	otf_Theano "$tb";
	otf_Veleka "$tb";
	otf_WorkSans "$tb";
	rm -rf tmp;
}

all () { 
	all_ttf_ofl_noto;
	all_ttf_ofl;
	all_ttf_ufl;
	all_ttf_apache2;
	all_otf_ofl;
}

new () {
<<<<<<< HEAD
	local tb="$fd/ttf-ofl-noto";
	mkdir -p "$tb";
	ttf_Noto "$tb";
=======
	local tb="$fd/ttf-ofl";
	mkdir -p "$tb";
	ttf_CharisSIL "$tb";
>>>>>>> c5752dfa31f3eda3110c64e49c0de624e8d1a32b
	rm -rf tmp;
}

# Run the functions

#all; 
new;

