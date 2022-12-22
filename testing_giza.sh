#!/bin/zsh
cd GIZA++-v2/
./plain2snt.out ../giza_example/data.en ../giza_example/data.es 
./snt2cooc.out ../giza_example/data.en.vcb ../giza_example/data.es.vcb ../giza_example/data.en_data.es.snt > ../giza_example/corp.cooc
./GIZA++ -S ../giza_example/data.es.vcb -T ../giza_example/data.en.vcb -C ../giza_example/data.en_data.es.snt -CoocurrenceFile ../giza_example/corp.cooc -outputpath ../giza_example/giza_output
