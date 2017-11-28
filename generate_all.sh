for f in $(find . -name '*.tex'); do
    a=$("pwd");
    DEST_DIR=$(dirname "${f}")
    cd $DEST_DIR;
    pdflatex $(basename $f);
    cd $a
done
