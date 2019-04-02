#!/bin/bash
set -e

pushd lergo-ri
    source ~/.nvm/nvm.sh
    nvm install
    npm install
popd

cd lergo-ri
echo 'pwd:'
pwd
# echo 'TESTME_KEY' $TESTME_KEY

echo 'creating file conf/dev/lergopro.pem'
mkdir conf/dev && touch conf/dev/lergopro.pem

echo 'decrypting lergopro pem'

source build/decrypt_lergopro_pem.sh
mkdir ~/.ssh && touch ~/.ssh/known_hosts
ssh-keyscan -H 52.211.75.196 >> ~/.ssh/known_hosts
export KEY_FILE=conf/dev/lergopro.pem

chmod 600 $KEY_FILE
ssh -i $KEY_FILE ubuntu@52.211.75.196 << EOF
echo 'inside lergo'
sudo service lergo upgrade && sudo service lergo stop && sudo service lergo start
sudo service lergo status
exit
EOF




