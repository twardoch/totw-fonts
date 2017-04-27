#!/usr/bin/env bash

dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir";

fd="$dir/../../fonts"; # Source folder for fonts
dd="$dir/../../download"; # Source folder for fonts

mkdir -p "$dd/totw-fonts";
cp "$fd/LICENSE.ufl" "$dd/totw-fonts";
find "$fd/ttf-ufl" -type f -iname '*.ttf' | while read p; do cp "$p" "$dd/totw-fonts"; done; 
cp "$fd/LICENSE.apache2" "$dd/totw-fonts";
find "$fd/ttf-apache2" -type f -iname '*.ttf' | while read p; do cp "$p" "$dd/totw-fonts"; done; 
cp "$fd/LICENSE.ofl" "$dd/totw-fonts";
find "$fd/ttf-ofl" -type f -iname '*.ttf' | while read p; do cp "$p" "$dd/totw-fonts"; done; 
find "$fd/otf-ofl" -type f -iname '*.otf' | while read p; do cp "$p" "$dd/totw-fonts"; done; 
zip -9 -j "$dd/totw-fonts.zip" $dd/totw-fonts/*.*

mkdir -p "$dd/totw-fonts-noto";
cp "$fd/LICENSE.ofl" "$dd/totw-fonts-noto";
find "$fd/ttf-ofl-noto" -type f -iname '*.ttf' | while read p; do cp "$p" "$dd/totw-fonts-noto"; done; 
zip -9 -j "$dd/totw-fonts-noto.zip" $dd/totw-fonts-noto/*.*
