build:
	./hash.sh
	pandoc -s -f markdown+smart -t beamer+smart hash.yaml meta.yaml README.md --listings --citeproc --pdf-engine=xelatex --template=template.tex  --lua-filter=include-code-files.lua --lua-filter=code-style.lua -o README.pdf

clean:
	rm -f README.pdf

.PHONY: build clean

all: build

