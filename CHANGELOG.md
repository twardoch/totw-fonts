# Changelog

All notable changes to the totw-fonts project will be documented in this file.

## [Unreleased] - 2025-06-26

### Added
- Git LFS support for .key files via .gitattributes
- Multiple font files to download/totw-fonts directory:
  - Aileron font family (Black, Bold, Heavy, Light, Regular, SemiBold, Thin, UltraLight variants with italics)
  - Fira Mono font family (Bold, Medium, Regular)
  - PT families (PT Sans, PT Serif, PT Mono with various weights)
  - Source Code Pro Regular
- Font files organized in fonts/ directory structure:
  - fonts/otf-apache2/adobe-fonts/source-code-pro/
  - fonts/otf-ofl/carrois/Fira/
  - fonts/otf-ofl/ssagano/Aileron/
  - fonts/ttf-ofl/paratype/ (PTMono, PTSans, PTSerif)
- Presentation slides: 314 PDF files (totw-001.pdf through totw-314.pdf) in pres/slides/
- Presentation source fonts in pres/src/totw-fonts/
- totw-170504.key presentation file (tracked with Git LFS)
- LICENSE files (apache2, ufl) in multiple directories

### Fixed
- File organization and structure

## [2017-12-10]

### Previous Updates
- Repository maintenance and updates (based on commit history)

## [2017-05-04]

### Initial Release
- First version of the curated open-source font collection
- Collection includes >2,000 open-source fonts
- Focus on fonts for longer texts with some display and decorative fonts
- Most fonts licensed under SIL Open Font License (OFL)
- Some fonts under Apache 2 or UFL licenses
- Download ZIPs available:
  - All fonts except Noto (118 MB, 902 fonts)
  - All Noto fonts except CJK (94 MB, 1256 fonts)