echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \
      --cache=$HOME/.npm/.cache/cnpm \
      --disturl=https://npm.taobao.org/dist \
      --userconfig=$HOME/.cnpmrc"' >> ~/.bashrc && source ~/.bashrc

# npm i -g npm to update

cnpm install phantomjs
