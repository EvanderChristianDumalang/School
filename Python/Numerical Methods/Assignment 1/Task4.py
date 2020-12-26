#No4                 
str1=input()
str2=input()

s1="".join(str1.split()) 
s2="".join(str2.split()) 

if(sorted(s1)== sorted(s2)): 
      print("Kedua string ANAGRAM!")  
else:
      print("Kedua string BUKAN ANAGRAM!")  
        
