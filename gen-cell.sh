find LoginCollectionViewCell|grep -v swift$|grep "/"|sed "s/LoginCollectionViewCell/$1/;"|sed 's/^/mkdir -p /'|sh
for l in `find LoginCollectionViewCell|grep swift`; do f=`echo $l|sed "s/LoginCollectionViewCell/$1/; s/Login/$1/;"`; echo cp $l $f; done|sh
for l in `find $1|grep swift`; do sed -i '' "s/Login/$1/; s/Login/$1/; s/Login/$1/;" $l; done
