currentdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
printf "Generating all snippets at $currentdir\n"
for dir in `find . -type d | sort`
do
 cd $dir
 dirbasename=$(basename $dir)
 for snippetname in `for f in *.*; do printf "${f%%.*}\n"; done | sort -u`;
 do
    if [ "$snippetname" != "meta" ] && [ "$dir" != "$snippetname" ] && [ "$dir" != "output" ];
    then
      mkdir "$snippetname"
      mv "$snippetname".* "$snippetname/"
      cd $snippetname
      countOfServerFiles=$(find . -name "$snippetname.rb" -o -name "$snippetname.cs" -o -name "$snippetname.php" -o -name "$snippetname.curl"  -o -name "$snippetname.py" | wc -l)
      echo "{" > meta.json
      echo "  \"title\": \"$snippetname\"," >> meta.json
      if [ "$countOfServerFiles" -gt "0" ]
      then
        echo "  \"type\": \"server\"" >> meta.json
      else
        echo "  \"type\": \"mobile\"" >> meta.json
      fi
      echo "}" >> meta.json
      countOfExtraCurlFiles=$(ls $snippetname.*.curl | wc -l)
      if [ "$countOfExtraCurlFiles" -gt "0" ]
      then
        printf "Eliminando $snippetname.curl sobrante en $dir\n"
        rm "$snippetname".curl
      fi
      countofOutPutFiles=$(find . -name "$snippetname.json" -o -name "$snippetname.xml" | wc -l)
      if [ "$countofOutPutFiles" -gt "0" ]
      then
        printf " - creating output files...\n"
        mkdir output
        mv "$snippetname".xml output/
        mv "$snippetname".json output/
      fi
      cd ..
    fi
 done
 cd $currentdir
done
