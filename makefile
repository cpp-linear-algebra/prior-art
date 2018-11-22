DOCTITLE=prior-art-for-linear-algebra

ifndef VERBOSE
.SILENT:
endif

all:	lua

verbose:	luaverb

lua:	${DOCTITLE}.tex clean
			echo "Compiling TeX Document using LuaLaTeX..."
			latexmk -lualatex -interaction=nonstopmode \
							-logfilewarnings- -quiet \
							-outdir=build-lua \
							${DOCTITLE}.tex > /dev/null 2> /dev/null
			echo "Cleaning up Files..."
			latexmk -lualatex -interaction=nonstopmode \
							-logfilewarnings- -quiet \
							-c -outdir=build-lua \
							${DOCTITLE}.tex > /dev/null 2> /dev/null
			cp build-lua/${DOCTITLE}.pdf ${DOCTITLE}.pdf
			echo "PDF File Generated..."

luaverb:	${DOCTITLE}.tex clean
					echo "Compiling TeX Document using LuaLaTeX..."
					latexmk -lualatex -interaction=nonstopmode \
									-outdir=build-lua \
									${DOCTITLE}.tex
					echo "Cleaning up Files..."
					latexmk -lualatex -interaction=nonstopmode \
									-c -outdir=build-lua \
									${DOCTITLE}.tex
					cp build-lua/${DOCTITLE}.pdf ${DOCTITLE}.pdf
					echo "PDF File Generated..."

clean:
			./clean.sh
