if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi
if [[ $# -eq 1 ]] ; then
    echo 'Need website directory'
    exit 0
fi

mkdir $2/$1
cat > $2/$1/index.html <<- EOM
<html>
<head>
<style>
body {
    margin: 0px; background-color: #16a085; color: white;
    display: flex; justify-content: center; align-items: center; font-size: 36px;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif
}
</style>
</head>
<body>
<p>Site coming soon</p>
</body>
</html>
EOM

chown -R $(logname) $2/$1
chgrp -R $(logname) $2/$1