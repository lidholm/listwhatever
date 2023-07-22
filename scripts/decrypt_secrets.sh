echo "Decrypting files"
echo $SOPS_AGE_KEY | head -c 20
echo "------------"
ls secrets
echo "------------"
cat scripts/secrets-configs.txt
echo "------------"


for config in `cat scripts/secrets-configs.txt`
do
    filename=`echo $config | cut -d "|" -f 1`
    destination=`echo $config | cut -d "|" -f 2`
    echo "/app/sops -d secrets/encrypted-$filename > $destination/$filename"
    if  test -f "/app/sops" ; then
        /app/sops -d secrets/encrypted-$filename > $destination/$filename
    else
        sops -d secrets/encrypted-$filename > $destination/$filename
    fi
done

