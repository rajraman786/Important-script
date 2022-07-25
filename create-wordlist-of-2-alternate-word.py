from operator import length_hint


word1=input("Enter 1st word ")
word2=input("Enter 2nd word ")
length = int(input("Enter no. of line "))
l=0
f=open("name.txt", "w+")
while(l<=length):
    f.write(f"{word1}\n")
    f.write(f"{word2}\n")
    l+=1

f.close()