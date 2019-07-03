
files_md = $(shell find source -name "*.md")
files_html = $(patsubst source/%.md,build/%.html,$(files_md))
 
.PHONY: all

all: $(files_html)
	echo $(files_md)

$(files_html): build/%.html: source/%.md process.py template.html
	mkdir -p $(dir $@)
	python process.py $< $@
	aws s3 cp $@ s3://19f075ca4a482833.media/wood_oven_book/$@ --acl public-read

#main.pdf: main.html
#	wkhtmltopdf main.html main.pdf
#	aws s3 cp main.html s3://19f075ca4a482833.media/wood_oven_book.html --acl public-read
#	aws s3 cp main.pdf s3://19f075ca4a482833.media/wood_oven_book.pdf --acl public-read


