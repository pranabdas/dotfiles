# This script converts Jekyll generated 404 page to its source code
origin=$HOME/Documents/github/pranabdas.github.io
dest=$HOME/Desktop

# remove all inline scrips
sed '/<script>/,/<\/script>/d' $origin/404.html > $dest/404.html

# inser following script under head tag
sed -i.bak '/<head>/a\
\    <script>\
\        var jekyllPages = [];\
\        {% for item in site.static_files %}\
\        jekyllPages.push("{{ site.url }}{{ item.path }}");\
\        {% endfor %}\
\        function jekyllFixCaseSensitiveUrl() {\
\            var url = window.location.toString();\
\            if (url.slice(-1) === "/") {\
\                url = url.slice(0, -1);\
\            }\
\            var page = jekyllPages.map(function (value) {\
\                return value.toLowerCase();\
\            });\
\            var i = page.indexOf(url.toLowerCase());\
\            if (i !== -1) {\
\                window.location = jekyllPages[i];\
\                console.log(jekyllPages[i]);\
\            }\
\        }\
\        window.onload = jekyllFixCaseSensitiveUrl();\
\    </script>\
' $dest/404.html

# insert front matter at the top
front_matter=`echo "---\n---\n"; cat $dest/404.html`
echo "$front_matter" > $dest/404.html
rm $dest/404.html.bak
echo "The 404.html is saved in $dest"
