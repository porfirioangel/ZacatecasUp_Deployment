#!/bin/bash

DIST_PATH="/var/www/html/ZacatecasUp"

cd $DIST_PATH

for i in *;do
    if [ "$i" != "ZacatecasUp_REST" ] && [ "$i" != "ZacatecasUp_WebApp" ] && 
        [ "$i" != "hook_rest.php" ] && [ "$i" != "hook_admin.php" ]; then
        rm -r "$i"
    fi
done

cd /var/www/html/ZacatecasUp/ZacatecasUp_WebApp

echo "Building web app..."
echo ""
~/.npm-global/bin/ng build --base-href /ZacatecasUp/
echo ""

echo "Moving the dist web app..."
echo ""
mv $DIST_PATH/ZacatecasUp_WebApp/dist/* $DIST_PATH

echo "Replacing base href in index.html..."
echo ""

sed -i 's,<base href="/ZacatecasUp/">,<base href="./">,g' $DIST_PATH/index.html
