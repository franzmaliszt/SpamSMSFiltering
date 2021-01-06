% Prediction can be made on command window using this function
% Please note that test.m script must be run once to train the model
% Example: PredictThis("Selam dostum bu mesaji siniflandirir misin")
function PredictThis(msg)
    global train spam_count legit_count;
    
    message = '';
    clean_msg = py.cleaner.clear_msg(msg);
    for i=1:length(clean_msg)
        message(i) = clean_msg(i);
    end
    
    prediction = Predict(message, train, spam_count, legit_count, "user_mode");
    
    if prediction > 0.5
        fprintf("Your message is spam with the accuracy of %.2f percentage \r\n", prediction*100)
    elseif prediction < 0.5
        fprintf("Your message is legitimate with the accuracy of %.2f percentage \r\n", (1 - prediction)*100)
    else
        disp("The model is not sure, the possibility is just the same for each class.")
    end
end