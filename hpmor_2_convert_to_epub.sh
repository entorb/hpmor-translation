# requirements
# Linux
# sudo apt-get install pandoc calibre

# MacOS
# brew install pandoc
# brew install calibre

# required for pdf
# sudo apt install texlive texlive-latex-base texlive-base texlive-lang-german texlive-latex-extra

# source is html file generated by hpmor_1_fetch_extract_convert_text.py

# V1: single threading
# for LANG in en de; 
#   do 
#   echo === $LANG ===
#     # epub
#     echo html to markdown
#     pandoc -o output/hpmor-$LANG.md    output/hpmor-$LANG.html

#     echo markdown to epub
#     pandoc -o output/hpmor-$LANG.epub  images/title-$LANG.md   output/hpmor-$LANG.md
#     # mobi
#     echo epub to mobi
#     pandoc -o output/hpmor-$LANG.mobi  output/hpmor-$LANG.epub
#     # markdown for simply modification
#     echo epub to pdf
#     pandoc -o output/hpmor-$LANG.pdf   output/hpmor-$LANG.epub
#   done

# V2: multi threading
echo === html to markdown ===
for LANG in en de; 
  do 
    pandoc -o output/hpmor-$LANG.md    output/hpmor-$LANG.html &
done
wait

echo === markdown to epub ===
for LANG in en de; 
  do 
    pandoc -o output/hpmor-$LANG.epub  images/title-$LANG.md   output/hpmor-$LANG.md &
done
wait
 
echo === epub to mobi and PDF ===
for LANG in en de; 
  do 
    # mobi via calibre on Mac
    /Applications/calibre.app/Contents/MacOS/ebook-convert output/hpmor-$LANG.epub output/hpmor-$LANG.mobi &
    # pandoc -o output/hpmor-$LANG.mobi  output/hpmor-$LANG.epub &
    # pdf did not work from html, so started from epub instead
    pandoc -o output/hpmor-$LANG.pdf   output/hpmor-$LANG.epub &
  done
wait