read -p "" nothing
echo "正在編譯…"
cp /data/mounted/Main.java /data/Main.java
cp /data/mounted/ans /data/ans
if [ -f "/data/Main.java" ]
then
    javac /data/Main.java
else
    echo "檔案寫入失敗！"
fi

if [ -f "/data/Main.class" ]
then
    script -q -c "java Main"
    col -bp < typescript > filtered2
    echo "======= 開始比對答案 ======="
    java Compare filtered2 ans
else
    echo "編譯失敗"
fi
read -p "執行完畢，按下Enter鍵後離開。" nothing
echo "======__EXITFLAG__======="
exit 0
