%% Introduction to Pattern Recognition
%%  Muhammed Ali Bulut -- 39809067204
%
%
%% Import Data
%
legitimate= importdata('data/stemmed_legitimate_sms.txt');
spam = importdata('data/stemmed_spam_sms.txt');
%
%% Merge two classes
%
data = vertcat(legitimate, spam).';
%
%% Label the merged table
%
label(1:length(legitimate))=0;
label(length(legitimate)+1:length(legitimate)+length(spam))=1;
data = [data;num2cell(label)];
%
%% Apply holdout method and create test and training sets
%
global train;
ratio = 0.7;
[train, test] = train_test(data, ratio);
%
%% Count classes in training set
%
spam_count = 0;
legit_count = 0;
for i=1:length(train)
    if train{2,i} == 1
        spam_count = spam_count + 1;
    else
        legit_count = legit_count + 1;
    end
end
%
%% Garbage collection
%
clear label legitimate spam data ratio;
%
%% Predicting function
%
truth = [];                                          % Actual class
prediction = [];                                     % Model prediction
for i=1:length(test)
    truth = [truth, test{2,i}];
    prediction = [prediction, Predict(test{1,i}, train, spam_count, legit_count, "test_mode")];
end
%
%% Confusion Matrix
%
C = confusionmat(truth, prediction);
confusionchart(C);
%
%% Evaluation
%
TP = C(1,1);
FP = C(1,2);
TN = C(2,2);
FN = C(2,1);
precision = TP/(TP+FP);
recall = TP/(TP+FN);
accuracy = (TP+TN)/(TP+FP+TN+FN);
fscore = 2*(precision*recall)/(precision+recall)
%
%% FUNCTIONS
%
%
function [Training,Testing] = train_test(dataset, r)
% Split given dataset into Training and Testing set by given percentage "P"
[m,n] = size(dataset);
idx = randperm(n);
Training = dataset(:,idx(1:round(r*n))); 
Testing = dataset(:,idx(round(r*n)+1:n));
end
%