#!/bin/bash

#set -x  # echo on


Accept="image/webp,image/apng,image/*,*/*;q=0.8"
Accept_Encoding="gzip, deflate, br"
Accept_Language="en,en-US;q=0.9,ru;q=0.8,az;q=0.7"
Connection="keep-alive"
DNT="1"
Host="api.qrserver.com"
Referer="http://goqr.me/"
User_Agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/63.0.3239.84 Chrome/63.0.3239.84 Safari/537.36"

First_name="Аббас"
Last_name="Гусенов"
Title=""
Street=""
Zip_code=""
City=""
Country=""
Company_Organisation=""
Email_personal=""
Email_business=""
Phone_personal=""
Phone_mobile=""
Phone_business=""
Website="https://github.com/gusenov"

curl -s -o "qr-code-vcard.png" "https://api.qrserver.com/v1/create-qr-code/" \
    --data-urlencode "data=BEGIN%3AVCARD%0AVERSION%3A2.1%0AFN%3A$First_name+$Last_name%0AN%3A$Last_name%3B$First_name%0ATITLE%3A$Title%0ATEL%3BCELL%3A$Phone_mobile%0ATEL%3BWORK%3BVOICE%3A$Phone_business%0ATEL%3BHOME%3BVOICE%3A$Phone_personal%0AEMAIL%3BHOME%3BINTERNET%3A$Email_personal%0AEMAIL%3BWORK%3BINTERNET%3A$Email_business%0AURL%3A$Website%0AADR%3A%3B%3B$Street%3B$City%3B%3B$Zip_code%3B$Country%0AORG%3A$Company_Organisation%0AEND%3AVCARD%0A" \
    --data-urlencode "size=420x420" \
    --data-urlencode "margin=0" \
    --header "Accept: $Accept" \
    --header "Accept-Encoding: $Accept_Encoding" \
    --compressed \
    --header "Accept-Language: $Accept_Language" \
    --header "Connection: $Connection" \
    --header "DNT: $DNT" \
    --header "Host: $Host" \
    --header "Referer: $Referer" \
    --header "User-Agent: $User_Agent"

Website_address=$Website
curl -s -o "qr-code-url.png" "https://api.qrserver.com/v1/create-qr-code/" \
    --data-urlencode "data=$Website_address" \
    --data-urlencode "size=420x420" \
    --data-urlencode "margin=0" \
    --header "Accept: $Accept" \
    --header "Accept-Encoding: $Accept_Encoding" \
    --compressed \
    --header "Accept-Language: $Accept_Language" \
    --header "Connection: $Connection" \
    --header "DNT: $DNT" \
    --header "Host: $Host" \
    --header "Referer: $Referer" \
    --header "User-Agent: $User_Agent"
