def count(elements,unigrgam):
    if elements[-1] == '.': 
        elements = elements[0:len(elements) - 1] 
   
    if elements in unigrgam: 
        unigrgam[elements] += 1
   
    else: 
        unigrgam.update({elements: 1}) 
   
def ngrams(s, n=2, i=0):
	while len(s[i:i+n]) == n:
		yield tuple(s[i:i+n])
		i += 1


if _name_ == '_main_':
	with open("transcript.txt") as file_in:
		lines = []
		for line in file_in:
			lines.append(line)
	
	for i in range(len(lines)):
		lines[i] = str("<s> ") + lines[i] + str(" </s>")
	#print(lines)
#	print("\n\n")
	unigrgam = {}
	
	for line in lines:
		lst = line.split()
		for elements in lst:
			count(elements,unigrgam)
	#(unigrgam)
	#print("\n\n")
	bigram_table = {}
	for line in lines:
		temp = ngrams(line.split(),n = 2)

		for pair in temp:
			if pair in bigram_table:
				bigram_table[pair] += 1
			else:
				bigram_table[pair] = 1
	#for x in bigram_table:
#		print(x,bigram_table[x])
#	print("\n\n")

	request = str(input("Enter request string : "))
	request = str("<s> " + request + " </s>")
	rqst_cpy = request
	rqst_bigram = ngrams(request.split(),n = 2)
	probability = 1
	# printing bigram table of sentence
	rqst_cpy = list(rqst_cpy.split(' '))
	print("\t" + str(rqst_cpy) )
	for i in rqst_cpy:
		print(str(i) ,end = "\t")
		for j in rqst_cpy:
			t = tuple()
			t = t + (i,)
			t = t + (j,)
			if t in bigram_table:
				print(str(bigram_table[t] + 1),end = "\t")
			else:
				print(str(1) ,end = "\t")
			
		print("\n")


	#print("\n"+str(len(unigrgam))+"\n")
	for pair in rqst_bigram:
		if pair in bigram_table:
			print(pair,bigram_table[pair] + 1)
			probability *= (bigram_table[pair] + 1) / (unigrgam[pair[0]] + len(unigrgam) )
		else:
			print(str(pair)+" Not Found, 1")
			probability *= (1) / (unigrgam[pair[0]] + len(unigrgam) )
		
	print(probability)