#!/bin/bash
cwd=$(pwd)
mkdir -p tmp/
source ~/src/twiml-generator/venv/bin/activate
if test -f "$cwd"/failed; then
    rm failed
fi
if test -f "$cwd"/passed; then
    rm passed
fi
cd ~/src/twiml-generator/ || exit
FILES=$(echo "$@" | tr " " "\n")
if [ -z "$FILES" ]; then
    echo "No files specified, regenerating everything."
    FILES=$(find ~/src/api-snippets/twiml -name "*.twiml" | grep "output")
fi
VERSIONS=( "python:.6.x.py"
           "java:.8.x.java"
           "node:.3.x.js"
           "csharp:.5.x.cs"
           "php:.6.x.php"
           "ruby:.5.x.rb" )
echo "$FILES" | while read -r line; do
    echo Starting "$line"
    for version in "${VERSIONS[@]}"; do
        lang="${version%%:*}"
        version="${version##*:}"
        path=$(echo "$line" | xargs -I {} dirname {} | xargs -I {} dirname {})
        file=$(basename "$path")
        outpath="${path}/${file}${version}"
        OUTPUT=$(~/src/twiml-generator/generator.py "$line" -out "$cwd/tmp/${file}${version}" -l "$lang")
        if [[ $OUTPUT == *"[passed]"* ]]; then
            OUTPUT=$(~/src/twiml-generator/generator.py "$line" -out "$outpath" -l "$lang")
            {
                echo "$line"
                echo "$OUTPUT"
                echo
            } >> "$cwd"/passed
        else
            {
                echo "$line"
                echo "$OUTPUT"
                echo
            } >> "$cwd"/failed
        fi
    done
done
rm -rf "$cwd/tmp/"

if test -f "$cwd"/failed; then
    echo ">>>>>>>>>>>>>>>>>>>"
    echo FAILED OUTPUT
    echo ">>>>>>>>>>>>>>>>>>>"
    cat "$cwd"/failed
    echo
fi
echo DONE

