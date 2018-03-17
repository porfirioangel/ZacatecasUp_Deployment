cd /home/ubuntu/ZacatecasUp
cp email.html current_email.html

echo "----------------------"
echo "$(date)"
echo ""

URL=$1

SUSTITUCION_STATUS="s/{{ hook_status }}/finished/g"
echo "Estableciendo status del hook..."
echo $SUSTITUCION_STATUS
sed -i "$SUSTITUCION_STATUS" current_email.html
echo ""

SUSTITUCION_URL="s,{{ repo_url }},$URL,g"
echo "Estableciendo url del repo..."
echo $SUSTITUCION_URL
sed -i "$SUSTITUCION_URL" current_email.html
echo ""

echo "Sending email notification..."
python notification_email.py
echo ""

rm current_email.html

echo "Fin"