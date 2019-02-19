currentdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
printf "Deleting redundant curl at at $currentdir\n"
for dir in `find . -type d | sort`
do
  dirbasename=$(basename "$dir")
  if [ "$dirbasename" != "output" ];
  then
   printf "Checking  $dir\n"
   cd $dir
   countOfExtraCurlFiles=$(ls $dirbasename.*.curl | wc -l)
   if [ "$countOfExtraCurlFiles" -gt "0" ];
   then
    printf "Deleting $dirbasename.curl unnecessary at $dir\n"
    rm "$dirbasename".curl
   fi
   cd $currentdir
  fi
done