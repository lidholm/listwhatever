echo "Decrypt sops file(s)"
export PATH="$PATH:."

echo "===="
echo $SOPS_AGE_KEY | head -c 20
echo "===="

sed -i'' -e 's/\r$//' ./scripts/decrypt_secrets.sh 
chmod +x ./scripts/decrypt_secrets.sh
bash -c './scripts/decrypt_secrets.sh'

echo "===="

sed -i'' -e 's/\r$//' ./scripts/replace_env_vars.py
head -c 20 '.prod.env'
python3 ./scripts/replace_env_vars.py 

echo "===="
grep android:value android/app/src/main/AndroidManifest.xml | tail -n 1 | head -c 34

