import re

from TurkishStemmer import TurkishStemmer


def clear_msg(msg):
    ts = TurkishStemmer()

    s_words = ["a","acaba","alti","altmis","ama","ancak","arada","artik","asla","aslinda","aslinda","ayrica","az","bana","bazen","bazi","bazilari","belki","ben","benden","beni","benim","beri","bes","bile","bilhassa","bin","bir","biraz","birçogu","birçok","biri","birisi","birkaç","birsey","biz","bizden","bize","bizi","bizim","böyle","böylece","bu","buna","bunda","bundan","bunlar","bunlari","bunlarin","bunu","bunun","burada","bütün","çogu","çogunu","çok","çünkü","da","daha","dahi","dan","de","defa","degil","diger","digeri","digerleri","diye","doksan","dokuz","dolayi","dolayisiyla","dört","e","edecek","eden","ederek","edilecek","ediliyor","edilmesi","ediyor","eger","elbette","elli","en","etmesi","etti","ettigi","ettigini","fakat","falan","filan","gene","geregi","gerek","gibi","göre","hala","halde","halen","hangi","hangisi","hani","hatta","hem","henüz","hep","hepsi","her","herhangi","herkes","herkese","herkesi","herkesin","hiç","hiçbir","hiçbiri","i","i","için","içinde","iki","ile","ilgili","ise","iste","itibaren","itibariyle","kaç","kadar","karsin","kendi","kendilerine","kendine","kendini","kendisi","kendisine","kendisini","kez","ki","kim","kime","kimi","kimin","kimisi","kimse","kirk","madem","mi","mi","milyar","milyon","mu","mü","nasil","ne","neden","nedenle","nerde","nerede","nereye","neyse","niçin","nin","nin","niye","nun","nün","o","öbür","olan","olarak","oldu","oldugu","oldugunu","olduklarini","olmadi","olmadigi","olmak","olmasi","olmayan","olmaz","olsa","olsun","olup","olur","olur","olursa","oluyor","on","ön","ona","önce","ondan","onlar","onlara","onlardan","onlari","onlarin","onu","onun","orada","öte","ötürü","otuz","öyle","oysa","pek","ragmen","sana","sanki","sanki","sayet","sekilde","sekiz","seksen","sen","senden","seni","senin","sey","seyden","seye","seyi","seyler","simdi","siz","siz","sizden","sizden","size","sizi","sizi","sizin","sizin","sonra","söyle","su","suna","sunlari","sunu","ta","tabii","tam","tamam","tamamen","tarafindan","trilyon","tüm","tümü","u","ü","üç","un","ün","üzere","var","vardi","ve","veya","ya","yani","yapacak","yapilan","yapilmasi","yapiyor","yapmak","yapti","yaptigi","yaptigini","yaptiklari","ye","yedi","yerine","yetmis","yi","yi","yine","yirmi","yoksa","yu","yüz","zaten","zira"]

    msg = msg.strip('\n')
    msg = re.sub(r'[^a-zA-ZçğıöşüÇĞİÖŞÜ]', ' ', msg)
    msg = msg.lower()
    msg = msg.split()
    msg = [ts.stem(word) for word in msg if word not in s_words]
    msg = ' '.join(msg)

    return msg
