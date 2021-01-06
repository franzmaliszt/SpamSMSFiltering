# Turkish Spam SMS Filtering using Text Classification

Muhammed Ali Bulut
Department of Computer Engineering, Eskişehir Technical University, Eskişehir
mabulut@eskisehir.edu.tr




 
Abstract—Spam filtering has been one of the most evolving algorithm in telecommunication industry as the internet has been the primary platform for marketing and scamming. To save the users being target, filtering is implemented in mail services. In this paper, a simple model is used to classify the messages as legitimate and spam messages. The model is formed after being trained on various data. Spam messages have certain infamous words in common, thus word-based model is expected to serve the purpose. Training and testing was done on MATLAB platform.

Keywords; spam, filtering, message, stemming

## I.	 INTRODUCTION
Spamming is one of the most utilized technique for scammers and companies who are in search of quick marketing. That is why people often find irrelevant messages in their inboxes. Picking them out before the spam messages meets the user is essential for user satisfaction. Thankfully, most spam messages have common words in them such as “prize, free, sale, promotion”. This creates the pattern we need to utilize into classifying them as spams. Text analysis is performed in such cases. However, this has downside of having multiple languages are primarily used in different regions of the world. For this reason, even though algorithm is the same, stopwords or stemming methods are not unified throughout the world.

## II.	DATASET
A dataset released by Pattern Analysis and Recognition Group is utilized to train and test the model. This dataset is put together by academics in Eskisehir Technical University and Eskisehir Osmangazi University.
The dataset includes 430 legitimate, 420 spam SMS messages. Thse are organic messages that was collected from different sources and under different context.

## III.	METHOD
### A.	Pre-processing
First step of pre-processing was removing stopwords in messages. These are the most widely used words in the language and do not provide much differentiating meaning, such as words like “ben, tamam, yedi, defa”.
Along with stopwords, every special characters and numbers were removed.
Turkish is an agglutinative language in which the suffixes are appended to the end of the word. Depending on the suffix, derivational suffixes create a stem with another meaning. Inflectional suffixes which does not add significant meaning to the word are removed by applying TurkishStemmer. These can be suffixes that indicates plurality, ownership, orientation, emphasis etc.
All the pre-processing was done using a custom Python script.

### B.	Feature Extraction
This is the process of extracting relevant properties in dataset for the purpose of classifiation. After pre-processing the dataset, we can clearly see that spam class has a pattern of including certaing words. So word frequency method is employed to define features. This refers to the number of times a word appears in a message.
Removing some words appearing below the certain threshold might come in handy, however this does not neccesarily a right action. As in some cases, words with low frequency may carry more information. In this project, such removal was not made.

### C.	Validation
To estimate skill of the model, holdout method (%70 Training - %30 Testing) is used to split the data. In this method, indexes are shuffled and pre-defined percentage of the data is selected as training or test set. Thanks to randomness, each time the program is run, the result changes, thus yielding an estimation.

### D.	Classification and Prediction
Bayes theorem is a way of finding a probability when we know certain other probabilities. In this project, it is employed to decide which class the message belongs to. Possibility of each word in iterated message’s classification is estimated using this formula. Results are then added up and a prediction is made on message’s belonging. 
In the end the model will have found where most of its words partipicated. In the case of equality, model will assume it is spam, since on average false positives outnumber false negatives.
The model is also capable of making prediction on user input whether it belongs in spam or legitimate class. This prediction is accompanied by its accuracy prediction.

## IV.	RESULT
After the model was tested 20 times, average f_score was 0,9356. Below is a confusion matrix provided by the built-in MATLAB function confusionchart().
