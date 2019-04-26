
.PHONY: all

all: main.pdf
	
main.html: main.md
	python make_pdf.py

main.pdf: main.html
	wkhtmltopdf main.html main.pdf
	xdg-open main.pdf

