# sudo apt-get install pandoc

# required for pdf
# sudo apt install texlive texlive-latex-base texlive-base texlive-lang-german texlive-latex-extra

# source is html file generated by fetch.py

for LANG in en de; 
  do 
  echo === $LANG ===
    # epub
    echo html to markdown
    pandoc -o output/hpmor-$LANG.md    output/hpmor-$LANG.html

    echo html to epub
    pandoc -o output/hpmor-$LANG.epub  images/title-$LANG.md   output/hpmor-$LANG.md
    # mobi
    echo epub to mobi
    pandoc -o output/hpmor-$LANG.mobi  output/hpmor-$LANG.epub
    # markdown for simply modification
    # pdf did not work from html, so started from epub instead
    echo epub to pdf
    pandoc -o output/hpmor-$LANG.pdf   output/hpmor-$LANG.epub
  done


