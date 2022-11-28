n="sillyGirl"
s="/volume1/docker/$n"
a=arm64
if [[ $(uname -a | grep "x86_64") != "" ]]; then 
    a=amd64
fi ;
if [ ! -d $s ]; then 
    mkdir $
fi ;
cd $s;
rm -rf $n;
v=`curl https://gitlab.com/cdle/$a/-/raw/main/compile_time.go --silent | tr -cd "[0-9]"`
d=""
if [ ${#v} == 13 ]; then
    d="https://gitlab.com/cdle/${a}/-/raw/main/sillyGirl_linux_${a}_${v}"
else
    v=`curl https://raw.githubusercontent.com/cdle/binary/main/compile_time.go --silent | tr -cd "[0-9]"`
    if [ ${#v} == 13 ]; then
        d="https://raw.githubusercontent.com/cdle/binary/main/sillyGirl_linux_${a}_${v}"
    else
        echo "Sorry锛屼綘缃戜笉濂斤紒"
        exit
    fi
fi
echo "妫€娴嬪埌鐗堟湰 $v"
echo "姝ｅ湪浠� $d 涓嬭浇..."
curl -o $n $d && chmod 777 $n
echo "宸插畨瑁呭埌 $n锛屽紑濮嬭繍琛�..."
"$s/$n" -t
