#!/bin/sh

sudo apt-get install build-essential libreadline-dev curl libssl-dev
git clone https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
mkdir -p ${HOME}/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-default-gems.git ${HOME}/.rbenv/plugins/rbenv-default-gems
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ${HOME}/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/rkh/rbenv-update.git ${HOME}/.rbenv/plugins/rbenv-update
cat <<EOS > ${HOME}/.rbenv/default-gems
bundler
pry
pry-doc
nokogiri
EOS
