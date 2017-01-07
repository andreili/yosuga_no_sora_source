#!/bin/sh

find "../data_yo/" -iname "*.cos" | sort > "./scripts.lst"
rm "./scenarios.lst"
while IFS= read -r file
do
	fn=`head -n 1 $file`
	if [[ "${fn::13}" == "Function sc00" ]]
	then
		fnn=${fn:9:-2}
		echo $fnn >> "./scenarios.lst"
		echo $file
		./conv.exe $file
		iconv -f UTF-16LE -t CP932 "${file}_new" > "./scenes/${fnn%/*}.cos"
	fi
done < "scripts.lst"

#rm ./to_build.bat
#link=""
#cat "scenarios.lst" | sort > "scenarios.lst"
#while IFS= read -r file
#do
#	echo "bin\\cotoco.exe /nologo /Fo out\\${file}.co scenes\\${file}.cos" >> ./to_build.bat
#	link="${link} out\\${file}.co"
#done < scenarios.lst
#echo "${link}" >> "./to_build.bat"
