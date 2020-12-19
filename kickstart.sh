#!/bin/bash

mkdir my-project
cd my-project
npm init -y
npm install typescript --save-dev
npm install rimraf --save-dev
./node_modules/typescript/bin/tsc --init --outDir "./out" --rootDir "./" --sourceMap true --moduleResolution "node" --target "es5"
echo "console.log('hello');" > index.ts
jq '.scripts = { start: "node out/index.js", prestart: "rimraf out && npm run build", build: "./node_modules/typescript/bin/tsc" }' package.json > package.json.tmp && mv -f package.json.tmp package.json