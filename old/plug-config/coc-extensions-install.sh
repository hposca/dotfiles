#!/usr/bin/env bash

# NOTE: I sincerely don't know if this is actually installing or not. It seems that I have to do CocInstall each one of them :/

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

sudo npm i -g bash-language-server
sudo npm i -g markdownlint

# Change extension names to the extensions you need
npm install \
  coc-diagnostic \
  coc-emoji \
  coc-go \
  coc-jedi \
  coc-json \
  coc-python \
  coc-sh \
  coc-snippets \
  --global-style \
  --ignore-scripts \
  --no-bin-links \
  --no-package-lock \
  --only=prod

# To install gopls
# GO111MODULE=on go get golang.org/x/tools/gopls@latest

# To install shfmt
# GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt

# To install golangci-lint
# go get github.com/golangci/golangci-lint/cmd/golangci-lint
