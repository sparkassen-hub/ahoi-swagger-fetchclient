#!/bin/sh

# npm install -g @compodoc/compodoc
npm install typedoc
# compodoc ./api.ts -p tsconfig.json -d ./docs --theme gitbook --hideGenerator --disableCoverage
# --toggleMenuItems default
./node_modules/typedoc/bin/typedoc --out ./docs ./api.ts --target ES6 --hideGenerator --module commonjs --excludePrivate --excludeProtected --excludeExternals --mode modules --theme default
cp AHOI-Logo.png ./docs/AHOI-Logo.png
