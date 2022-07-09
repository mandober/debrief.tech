# rts to md

# Convert RST to Markdown using Pandoc

FILES=*.rst

for f in $FILES
do
  filename="${f%.*}"
  echo "Converting $f to $filename.md"
  `pandoc $f -f rst -t markdown -o $filename.md`
done

# pandoc "$f" --from=rst --to=markdown --output="$fname.md"
# pandoc fname.rst -f rst -t markdown -o fname.md
# pandoc fname.rst --from=rst --to=markdown --output=fname.md


pandoc ambiguous_types.rst --from=rst --to=markdown --output=ambiguous_types.md
