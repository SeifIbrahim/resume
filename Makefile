.PHONY: all
BT = bibtex 
CC = xelatex
OUT_DIR = ./
COVERLETTER_OUT_DIR = ./coverletters
CV_DIR = ./details
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex') 
CLS = awesome-cv.cls
all: $(foreach x, $(patsubst $(COVERLETTER_OUT_DIR)/%_coverletter.tex, %_coverletter, $(wildcard $(COVERLETTER_OUT_DIR)/*_coverletter.tex)) cv , $x.pdf)


cv.pdf: cv.tex $(CV_SRCS) $(CLS)
	$(CC) -output-directory=$(OUT_DIR) $<

%_coverletter.pdf: $(COVERLETTER_OUT_DIR)/%_coverletter.tex $(CLS)
	$(CC) -output-directory=$(COVERLETTER_OUT_DIR) $<




clean:
	rm -rf $(OUT_DIR)/*.pdf  $(OUT_DIR)/*.aux  $(OUT_DIR)/*.log  $(OUT_DIR)/*.bbl $(OUT_DIR)/*.blg $(OUT_DIR)/*.out
	rm -rf $(COVERLETTER_COVERLETTER_OUT_DIR)/*.pdf  $(COVERLETTER_OUT_DIR)/*.aux  $(COVERLETTER_OUT_DIR)/*.log  $(COVERLETTER_OUT_DIR)/*.bbl $(COVERLETTER_OUT_DIR)/*.blg $(COVERLETTER_OUT_DIR)/*.out
