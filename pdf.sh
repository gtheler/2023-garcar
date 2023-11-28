hash=$(git rev-parse --short HEAD)
headepoch=$(git log -1 --format="%ct")
date="${hash}---$(LC_ALL=${DATELC} date -d@${headepoch} +%Y-%m-%d)"
if [ ! -z "$(git status --porcelain)" ]; then
  date="${date}+"
fi

cat << EOF > hash.yaml
---
date: ${date}
...
EOF


# pandoc -s -f markdown+smart 2022-feenox.md -t gfm -o README.md \
#   --lua-filter=include-code-files.lua \
#   --lua-filter=code-style.lua

  
 
pandoc -s -f markdown+smart -t beamer+smart hash.yaml README.md -o README.pdf \
  --lua-filter=include-code-files.lua \
  --lua-filter=code-style.lua \
  --listings \
  --pdf-engine=xelatex \
  --template=template.tex
