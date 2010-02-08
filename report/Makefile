REPORT = report

all:
	latex $(REPORT)
	bibtex $(REPORT)
	bibtex $(REPORT)
	latex $(REPORT)	# Build dvi
	latex $(REPORT)	# Inserts reference indicators at points of citation
	dvipdf $(REPORT).dvi

clean:
	rm -f *.aux *.ps *.dvi *.log *~ *.bak *.bbl *.blg

realclean: clean
	rm -f *.pdf

public: all
	install $(REPORT).pdf /home/fhuizing/www/


