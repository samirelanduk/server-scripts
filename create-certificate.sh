if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi

sitename="$1"

dotcount="$(awk -F'.' '{print NF-1}' <<< $1)"

if [[ $dotcount -eq 1 ]] ; then
    sitename="$sitename -d www.$sitename"
fi

sitename="-d $sitename"

echo $sitename

letsencrypt certonly -a webroot --webroot-path=/var/www/html $sitename