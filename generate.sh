#!/bin/sh

git clone https://github.com/swagger-api/swagger-codegen
# TODO: should we use Docker?
cd ./swagger-codegen
./mvnw clean package
cd ..

java -jar swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
   -i https://banking-sandbox.starfinanz.de/ahoi/docs/api/v2/swagger.json \
   -l typescript-fetch \
   --additional-properties npmName=ahoi-swagger-fetchclient,snapshot=false,npmVersion=0.0.1 \
   -o .

rm -rf ./swagger-codegen

cp README.md-replace README.md

npm install
npm run build

npm install -g @compodoc/compodoc
compodoc ./api.ts -p tsconfig.json -d ./docs --theme gitbook --hideGenerator --disableCoverage --toggleMenuItems default
cp AHOI-Logo.png ./docs/AHOI-Logo.png