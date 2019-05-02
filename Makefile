
files_md = $(shell find . -name "*.md")
 
.PHONY: all

all: main.pdf
	echo $(files_md)
	
main.html: $(files_md)
	python make_pdf.py

main.pdf: main.html
	wkhtmltopdf main.html main.pdf
	aws s3 cp main.html s3://19f075ca4a482833.media/wood_oven_book.html --acl public-read
	aws s3 cp main.pdf s3://19f075ca4a482833.media/wood_oven_book.pdf --acl public-read
	xdg-open main.pdf


