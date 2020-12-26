#No2
var = "denny nama public"
print("a = ",*map(var.lower().count, "a"))
print("e = ",*map(var.lower().count, "e"))
print("i = ",*map(var.lower().count, "i"))
print("u = ",*map(var.lower().count, "u"))
print("o = ",*map(var.lower().count, "o"))

Consonant = list("bcdfghjklmnpqrstvwxyz")
DeadAlphabet = sum(ele in Consonant for ele in var)
print("\nHuruf mati =",DeadAlphabet)