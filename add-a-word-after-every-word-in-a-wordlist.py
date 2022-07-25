word=input("Enter the word to be add ")
file_name=input("Enter the file name ")
f = open(file_name,"r")
d=open("newlist.txt", "w+")

for i in f:
    d.write(f"{i}")
    d.write(f"{word}\n")

f.close()
d.close()