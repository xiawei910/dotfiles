echo "registry=https://registry.npm.taobao.org/" > ~/.atom/.apmrc
echo "strict-ssl=false" >> ~/.atom/.apmrc

apm install markdown-preview-enhanced
apm install Sublime-Style-Column-Selection
apm install tablr
apm install pretty-json
apm install rst-preview
apm install atom-beautify

#additional package
pip install sqlparse

#parse cson file and update configure file
npm install -g cson
pip install cson

python update_config.py

#additional package to 'markdown-preview-enhanced'
#cd ~/.atom/
#npm install phantomjs
#cd -
#brew install phantomjs
