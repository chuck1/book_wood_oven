
.PHONY: all

all: main.pdf
	
main.html: main.md
	python make_pdf.py

main.pdf: main.html
	wkhtmltopdf main.html main.pdf
	xdg-open main.pdf
	aws s3 cp main.pdf s3://19f075ca4a482833.media/wood_oven_book.pdf --acl public-read


