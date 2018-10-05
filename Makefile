.PHONY: all
BT = bibtex 
CC = xelatex
OUT_DIR = ./
CV_DIR = ./details
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex') 
CLS = awesome-cv.cls
all: $(foreach x, coverletter cv , $x.pdf)


cv.pdf: cv.tex $(CV_SRCS) $(CLS)
	$(CC) -output-directory=$(OUT_DIR) $<

coverletter.pdf: $(OUT_DIR)/coverletter.tex $(CLS)
	$(CC) -output-directory=$(OUT_DIR) $<




clean:
	rm -rf $(OUT_DIR)/*.pdf  $(OUT_DIR)/*.aux  $(OUT_DIR)/*.log  $(OUT_DIR)/*.bbl $(OUT_DIR)/*.blg $(OUT_DIR)/*.out
