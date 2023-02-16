nationality_1 = "en"
nationality_2 = "ge"
with open(f'{nationality_1}-{nationality_2}.tsv') as inpf, open(f'our_{nationality_1}.txt',"w") as engOutf, open(f"our_{nationality_2}.txt","w") as gaOutf:
	for line in inpf:
		_, en_sentence, _, ga_sentence = line.replace('\n','').split("\t")
		engOutf.write(en_sentence+"\n")
		gaOutf.write(en_sentence+"\n")
		
