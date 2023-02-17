#!/bin/sh
n1="en"
n2="ge"
folder_name="our"
cd GIZA++-v2/
./plain2snt.out ../giza_example/$folder_name/data.$n1 ../giza_example/$folder_name/data.$n2 
mv ../giza_example/$folder_name/data.$n1.vcb ../giza_example/$folder_name/outputs/data.$n1.vcb 
mv ../giza_example/$folder_name/data.$n2.vcb ../giza_example/$folder_name/outputs/data.$n2.vcb 
mv "../giza_example/${folder_name}/data.${n1}_data.${n2}.snt" ../giza_example/$folder_name/outputs/data.$n1.snt 
mv "../giza_example/${folder_name}/data.${n2}_data.${n1}.snt" ../giza_example/$folder_name/outputs/data.$n2.snt 

./snt2cooc.out "../giza_example/$folder_name/outputs/data.$n1.vcb"\
	       "../giza_example/$folder_name/outputs/data.$n2.vcb"\
	       "../giza_example/$folder_name/outputs/data.$n2.snt" > ../giza_example/$folder_name/outputs/corp.cooc

cd ..
cd ./mkcls-v2/
./mkcls -p"../giza_example/$folder_name/outputs/data.$n1.vcb"\
       -V"../giza_example/$folder_name/outputs/data.$n1.vcb.classes"

./mkcls -p"../giza_example/$folder_name/outputs/data.$n2.vcb"\
        -V"../giza_example/$folder_name/outputs/data.$n2.vcb.classes"

cd .. 
cd GIZA++-v2/
./GIZA++ -S "../giza_example/$folder_name/outputs/data.$n2.vcb"\
	 -T "../giza_example/$folder_name/outputs/data.$n1.vcb"\
         -C "../giza_example/$folder_name/outputs/data.$n1.snt"\
	 -CoocurrenceFile ../giza_example/corp.cooc 
