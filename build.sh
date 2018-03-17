stack build
mkdir -p html-src
rm -rf html-src/*.js
cp -n $(stack path --local-install-root)/bin/nirvana.jsexe/*.html html-src/
cp $(stack path --local-install-root)/bin/nirvana.jsexe/*.js html-src/
(cd html-src; python -m SimpleHTTPServer 8000)