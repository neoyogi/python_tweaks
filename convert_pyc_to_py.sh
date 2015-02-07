CDIR=$(pwd)
for i in $(ls -R | grep :); do
    DIR=${i%:}                    # Strip ':'
    cd $DIR
    echo $DIR
    listoffiles=`find . -maxdepth 1 -name "*.pyc"`
    for i in $listoffiles;
      do
      pyfile=`basename $i pyc`
      pyfile+="py"
      uncompyler.py $i > $pyfile
      sed -i '/decompyling/d' $pyfile
      rm $i
      done
    cd $CDIR
done
