%Voluntary HW #1 by Eren Çetin
%Mastermind Game 27.10.2017
fprintf('Welcome to the Mastermind Game!\n');
answer(1)='y';
%first we create a random number.
while answer(1)=='y' || answer(1)=='Y'
    a= randi([1,9]);
    b= randi([0,9]);
    c= randi([0,9]);
    d= randi([0,9]);
    while a==b || a==c || a==d || b==c || b==d || c==d
        a= randi([1,9]);
        b= randi([0,9]);
        c= randi([0,9]);
        d= randi([0,9]);
    end
    
    %we need counters in order to determine the 10 trials of user and find
    %which numbers are placed correct or wrong.
    countguess=0;
    truedigit=0;
    falsedigit=0;
    while countguess~=10 && countguess~=11
        countguess=countguess+1;
        fprintf('Enter guess #%g:',countguess);
        guess= input(' ');
        
        %this part is to find the users input digits.
        a1= floor(guess/1000);
        b1= floor((guess-a1*1000)/100);
        c1= floor((guess-a1*1000-b1*100)/10);
        d1= guess-a1*1000-b1*100-c1*10;
        if guess>9999
            fprintf('You should give a 4-digit number with non-repeating digits.\n');
            countguess=countguess-1;
        elseif a1==0
            fprintf('You should give a 4-digit number with non-repeating digits.\n');
            countguess=countguess-1;
        elseif a1==b1 || a1==c1 || a1==d1 || b1==c1 || b1==d1 || c1==d1
            fprintf('You should give a 4-digit number with non-repeating digits.\n');
            countguess=countguess-1;
        elseif a1==a && b1==b && c1==c && d1==d
            fprintf('Well done! You have found it!\n\n')
            countguess=11;
        else
            
            %now the computer is trying to find the score of user ny the
            %counters.
            if a==a1
                truedigit=truedigit+1;
            end
            if b==b1
                truedigit=truedigit+1;
            end
            if c==c1
                truedigit=truedigit+1;
            end
            if d==d1
                truedigit=truedigit+1;
            end
            if a==b1 || a==c1 || a==d1
                falsedigit=falsedigit-1;
            end
            if b==a1 || b==c1 || b==d1
                falsedigit=falsedigit-1;
            end
            if c==a1 || c==b1 || c==d1
                falsedigit=falsedigit-1;
            end
            if d==a1 || d==b1 || d==c1
                falsedigit=falsedigit-1;
            end
            fprintf('OK. Your score: +%g %g\n',truedigit,falsedigit);
            truedigit=0;
            falsedigit=0;
        end
    end
    if countguess==10
        fprintf('You busted! The correct number was %g%g%g%g.\n\n',a,b,c,d)
    end
    
    %turns the operation back to the beginning if the users defines answer
    %as 'y' or 'Y'.
    flag=true;
    while flag==true
        answer= input('Do you want to play again? ','s');
        switch answer
            case 'Y'
                flag=false;
            case 'y'
                flag=false;
            case 'n'
                flag=false;
            case 'N'
                flag=false;
            otherwise
                fprintf('Invalid input.\n');
        end
    end
end
fprintf('End run.\n')