have_iostat=`which iostat`
[[ "$?" == "0" ]] && iostat -x | gawk '/(sd\w|dm-[[:digit:]])/ {print $1": "$NF}' | tr "\n" " "
exit 0
