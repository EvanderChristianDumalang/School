# !pip install num2words
#No3 kelanjutan
from num2words import num2words
from decimal import Decimal

var = int(input("input: ")) 
if var < 2000:
  print("Angka Harus Lebih Besar dari 2000")
else:
  print(num2words(Decimal(str(var)), lang='id').title())