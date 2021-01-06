import re

from TurkishStemmer import TurkishStemmer


def normalize(path, out_path):
    normalized = []

    with open(path, 'r', encoding="utf8") as legit:
        for message in legit:
            message = message.strip('\n')
            message = re.sub(r'[^a-zA-ZçğıöşüÇĞİÖŞÜ]', ' ', message)
            message = message.lower()
            message = message.split()
            message = [ts.stem(word) for word in message if word not in stopwords]
            message = ' '.join(message)
            normalized.append(message)

    with open(out_path, 'w', encoding="utf-8") as out_file:
        out_file.write("\n".join(normalized))


if __name__ == '__main__':
    ts = TurkishStemmer()

    stopwords_path = 'data/tr_stopwords.txt'

    legitimate_path = 'data/sms_legitimate.txt'
    spam_path = 'data/sms_spam.txt'

    stemmed_legit_path = 'data/stemmed_legitimate_sms.txt'
    stemmed_spam_path = 'data/stemmed_spam_sms.txt'

    stopwords = []

    with open(stopwords_path, 'r', encoding="utf8") as tr_stopwords:
        for word in tr_stopwords:
            stopwords.append(word.strip('\n'))

    normalize(legitimate_path, stemmed_legit_path)
    normalize(spam_path, stemmed_spam_path)
