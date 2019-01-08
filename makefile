DOCTITLE=prior-art-for-linear-algebra

ifndef VERBOSE
.SILENT:
endif

all:	pdf

verbose:	pdfverb

pdf:	${DOCTITLE}.tex clean
	echo "Compiling TeX Document using PDFLaTeX..."
	latexmk -pdf -interaction=nonstopmode \
		-logfilewarnings- -quiet \
		-outdir=build-pdf \
		${DOCTITLE}.tex > /dev/null 2> /dev/null
		echo "Cleaning up Files..."
	latexmk -pdf -interaction=nonstopmode \
		-logfilewarnings- -quiet \
		-c -outdir=build-pdf \
		${DOCTITLE}.tex > /dev/null 2> /dev/null
	cp build-pdf/${DOCTITLE}.pdf ${DOCTITLE}.pdf
	echo "PDF File Generated..."

pdfverb:	${DOCTITLE}.tex clean
	echo "Compiling TeX Document using PDFLaTeX..."
	latexmk -pdf -interaction=nonstopmode \
	-outdir=build-pdf \
	${DOCTITLE}.tex
	echo "Cleaning up Files..."
	latexmk -pdf -interaction=nonstopmode \
	-c -outdir=build-pdf \
	${DOCTITLE}.tex
	cp build-pdf/${DOCTITLE}.pdf ${DOCTITLE}.pdf
	echo "PDF File Generated..."

clean:
	./clean.sh
