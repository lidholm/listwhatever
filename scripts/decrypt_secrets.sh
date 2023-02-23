echo "Decrypting files"
echo $SOPS_AGE_KEY | head -c 20
echo "------------"
ls secrets
echo "------------"
cat scripts/secrets-configs.txt
echo "------------"
ls -a
echo "------------"


for config in `cat scripts/secrets-configs.txt`
do
    filename=`echo $config | cut -d "|" -f 1`
    destination=`echo $config | cut -d "|" -f 2`
    echo "/sops -d secrets/encrypted-$filename > $destination/$filename"
    /sops -d secrets/encrypted-$filename > $destination/$filename
done

