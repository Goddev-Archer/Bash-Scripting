text=$*
echo "------------------------------"
echo
for ((i=${#text}-1; i>=0; i--)); do
    echo -n "${text:$i:1}"
done
echo
echo
echo "------------------------------"
