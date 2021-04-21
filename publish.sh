#!/bin/bash

jupyter nbconvert Projects.ipynb --to slides --no-prompt --TagRemovePreprocessor.remove_input_tags='["remove_cell"]' --SlidesExporter.reveal_theme=simple --reveal-prefix=reveal.js
mv Projects.slides.html  index.html
mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git add -A .
git commit -m "Update"
git checkout -B gh-pages
cp -r /tmp/workspace/* .
git add -A .
git commit -m "new version"
git push origin master gh-pages
git checkout master
rm -rf /tmp/workspace
