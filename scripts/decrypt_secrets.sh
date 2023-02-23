echo "Decrypting files"
echo $SOPS_AGE_KEY | head -c 20
for config in `cat scripts/secrets-configs.txt`
do
    filename=`echo $config | cut -d "|" -f 1`
    destination=`echo $config | cut -d "|" -f 2`
    /sops -d secrets/encrypted-$filename > $destination/$filename
done

