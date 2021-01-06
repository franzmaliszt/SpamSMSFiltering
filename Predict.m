function prediction = Predict(message, train, spam_count, legit_count, mode)
% Predicts if a message is legitimate or spam
spam_occurence = 0;
legit_occurence = 0;

msg = split(message);                                                       % Split the message into a list
for j=1:length(msg)                                                         % Count how many times each word in message occur in spam and legit lists
    s_count = 0;
    l_count = 0;
    
    for i=1:length(train)                                                   % Finds how many times the word in message being predicted occur in training dataset
        if train{2,i} == 1 && contains(train{1,i},msg{j})                   % If the message is spam and contains the word 
            s_count = s_count + 1;
        end
        if train{2,i} == 0 && contains(train{1,i},msg{j})                   % If the message is legitimate and contains the word
            l_count = l_count + 1;
        end 
    end
    
    bayesian_spam = (s_count*spam_count)/(s_count*spam_count + l_count*legit_count);
    bayesian_legit = (l_count*legit_count)/(s_count*spam_count + l_count*legit_count);
    
    if bayesian_spam >= bayesian_legit                                      % If bayesian probability of spam is higher, the word is preicted as spam
        spam_occurence = spam_occurence + 1;
    else
        legit_occurence = legit_occurence + 1;
    end
end
    if mode == "test_mode"                                                  % Return spam or legit in test mode
        if spam_occurence > legit_occurence
            prediction = 1;
        else
            prediction = 0;
        end
    else                                                                    % If using user input mode, return accuracy
        if spam_occurence > legit_occurence
            prediction = 0 + (spam_occurence/(spam_occurence+legit_occurence));
        elseif spam_occurence < legit_occurence
            prediction = 1 - (legit_occurence/(spam_occurence+legit_occurence));
        else
            prediction = 0;
        end
    end
end