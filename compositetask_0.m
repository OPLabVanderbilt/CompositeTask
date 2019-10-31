%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% composite task
%% IDEAL
%% aligned only, 5 top/bots
%% modified timing from Alan's PS paper
%% Oct. 2013
%% modified by Mackenzie July 2017 so that it runs 180 trials
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%condition 1 both same, top cue aligned
%condition 2 top different bottom same top cue aligned
%condition 3 top same bottom different top cue aligne
%condition 4 top both different top cue aligned
function [] = compositetask_0(subjno,subjini,age,sex,hand)
try
        %% Open Screen
        whichScreen = 0; %changed to 1 to test on laptop
        
        %% Open Screen
        [w, rect] = Screen('OpenWindow', whichScreen, 255);
        xc = rect(3)/2;
        yc = rect(4)/2;
        
        Screen(w, 'TextSize', 24);
        Screen(w, 'TextFont', 'Arial');
        Screen(w, 'TextStyle', 1);
        hand = hand;
        age = age;
        sex = sex;
        category = 0; % sets category
        
        %% create files for saving data
        cd('data_C')
        fileName1 = ['C_' num2str(subjno) '_' subjini '_' num2str(category) '.txt'];
        dataFile1 = fopen(fileName1, 'w');
        cd('..')
        
        ListenChar(2);
        HideCursor;
        commandwindow;
        
        %% make mask
        if category == 1
            mask = imread('mask_1.jpg');
        elseif category == 2
            mask = imread('mask_2.jpg');
        elseif category == 0
            mask = imread('mask_0.jpg');
        end
        
        mask = imresize(mask, [129 126]);
        %mask = repmat(mask,[1 1 3]);
        
        %% make cues
        topcue = imread('topcue.JPEG');
        topcue = imresize(topcue, [30 126]);
        
        botcue = imread('botcue.JPEG');
        botcue = imresize(botcue, [30 126]);
        
        blankcue = 255*ones(30, 126, 3);
        
        %% load instruction Screens
        instruct1 = imread('instruct1.jpg');
        instruct1_texture = Screen('MakeTexture', w, instruct1);
        
        instruct2 = imread('instruct2.jpg');
        instruct2_texture = Screen('MakeTexture', w, instruct2);
        
        instruct_practice = imread('instruct_practice.jpg');
        instruct_practice_texture = Screen('MakeTexture', w, instruct_practice);
        
        instruct_begin = imread('instruct_begin.jpg');
        instruct_begin_texture = Screen('MakeTexture', w, instruct_begin);
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Practice trials instructions
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [trial top1_name bot1_name top2_name bot2_name cue cond align] = textread([num2str(category) '_practice.txt'], '%u %s %s %s %s %s %u %s');
        
        Screen('DrawTexture', w, instruct1_texture);
        Screen('Flip', w);
        while 1
            [keyIsDown,secs,keyCode]=KbCheck;
            if keyIsDown
                responsecode=find(keyCode);
                if responsecode==KbName('space')
                    break
                end
            end
        end
        Screen('Flip',w);
        while KbCheck; end
        
        Screen('DrawTexture', w, instruct2_texture);
        Screen('Flip', w);
        while 1
            [keyIsDown,secs,keyCode]=KbCheck;
            if keyIsDown
                responsecode=find(keyCode);
                if responsecode==KbName('space')
                    break
                end
            end
        end
        Screen('Flip',w);
        while KbCheck; end
        
        Screen('DrawTexture', w, instruct_practice_texture);
        Screen('Flip',w);
        while 1
            [keyIsDown,secs,keyCode]=KbCheck;
            if keyIsDown
                responsecode=find(keyCode);
                if responsecode==KbName('space')
                    break
                end
            end
        end
        Screen('Flip',w);
        while KbCheck; end
        
        ntrials = 8;
        
        for i = 1:ntrials
            
            %blank 500ms
            %Screen('DrawTexture', w, blanktexture);
            t = Screen('Flip', w);
            
            %fixation 500ms
            center_text(w, '+', 0, 0);
            t = Screen('Flip', w, t+.5);
            
            %study object 500ms
            imtop1 = imread(['stimuli/top/' char(top1_name(i))]);
            imbot1 = imread(['stimuli/bot/' char(bot1_name(i))]);
            
            if strcmp(cue{i}, 'top')
                compim = [blankcue; imtop1(1:63,:,:);imbot1(64:end,:,:); blankcue];
            elseif strcmp(cue{i}, 'bot')
                compim = [blankcue; imtop1(1:63,:,:);imbot1(64:end,:,:); blankcue];
            end
            compim(94:96,:)=0;  %%re-add black line
            
            studytexture = Screen('MakeTexture', w, compim);
            Screen('DrawTexture', w, studytexture);
            t = Screen('Flip', w, t+.5);
            
            %mask 2400ms no cue + 500ms with cue
            maskim = [blankcue; mask; blankcue];
            if strcmp(cue{i}, 'top')
                cuedmask = [topcue; mask; blankcue];
            elseif strcmp(cue{i}, 'bot')
                cuedmask = [blankcue; mask; botcue];
            end
            
            masktexture = Screen('MakeTexture', w, maskim);
            Screen('DrawTexture', w, masktexture);
            t = Screen('Flip', w, t+.5);
            
            cuedmasktexture = Screen('MakeTexture', w, cuedmask);
            Screen('DrawTexture', w, cuedmasktexture);
            t = Screen('Flip', w, t+2.4);
            
            %test object until response (max 3s)
            imtop2 = imread(['stimuli/top/' char(top2_name(i))]);
            imbot2 = imread(['stimuli/bot/' char(bot2_name(i))]);
            if strcmp(cue{i}, 'top')
                testim = [topcue; imtop2(1:63,:,:);imbot2(64:end,:,:); blankcue];
            elseif strcmp(cue{i}, 'bot')
                testim = [blankcue; imtop2(1:63,:,:);imbot2(64:end,:,:); botcue];
            end
            testim(94:96,:)=0;  %%re-add black line
            
            testtexture = Screen('MakeTexture', w, testim);
            Screen('DrawTexture', w, testtexture);
            t = Screen('Flip', w, t+.5);
            
            FlushEvents('keyDown');
            temp = 0;
            rt = GetSecs;
            responsecode = 0;
            
            
            %record response time
            resp1 = KbName('j');
            resp2 = KbName('k');
            GoOn = 0;
            keyIsDown = 0;
            while GoOn == 0;
                temp = GetSecs-rt;
                if temp > 3
                    GoOn = 1;
                end
                [keyIsDown, secs, keyCode] = KbCheck;
                if keyIsDown
                    responsecode = find(keyCode);
                    if responsecode == resp1 | responsecode == resp2
                        keyIsDown = 0;
                        GoOn = 1;
                    end
                    if responsecode == KbName('q')
                        Screen('CloseAll');
                    end
                end
            end
            
            Screen('Close', studytexture);
            Screen('Close', testtexture);
            Screen('Close', masktexture);
            Screen('Close', cuedmasktexture);
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Experimental trials block 1
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [trial top1_name bot1_name top2_name bot2_name cue cond align] = textread([num2str(category) '_trials.txt'], '%u %s %s %s %s %s %u %s');
        
        %% instructions
        Screen('DrawTexture', w, instruct_begin_texture);
        Screen('Flip', w);
        while 1
            [keyIsDown,secs,keyCode]=KbCheck;
            if keyIsDown
                responsecode=find(keyCode);
                if responsecode==KbName('space')
                    break
                end
            end
        end
        Screen('Flip',w);
        while KbCheck; end
        
        ntrials = length(trial); %gets the number of trials
        
        for i = 1:ntrials
            
            %sets breaks
            if i>1 && mod(i-1,72)==0
                Screen('Flip',w);
                center_text(w,'Take a break', 0, 0);
                center_text(w, 'Press the spacebar when you are ready to continue',0,50);
                Screen('Flip',w);
                while 1
                    [keyIsDown,secs,keyCode]=KbCheck;
                    if keyIsDown
                        responsecode=find(keyCode);
                        if responsecode==KbName('space')
                            break
                        end
                    end
                end
            end
            while KbCheck; end;
            
            %blank 500ms
            %Screen('DrawTexture', w, blanktexture);
            t = Screen('Flip', w);
            
            %fixation 500ms
            center_text(w, '+', 0, 0);
            t = Screen('Flip', w, t+.5);
            
            %study object 500ms
            imtop1 = imread(['stimuli/top/' char(top1_name(i))]);
            imbot1 = imread(['stimuli/bot/' char(bot1_name(i))]);
            
            if strcmp(cue{i}, 'top')
                compim = [blankcue; imtop1(1:63,:,:);imbot1(64:end,:,:); blankcue];
            elseif strcmp(cue{i}, 'bot')
                compim = [blankcue; imtop1(1:63,:,:);imbot1(64:end,:,:); blankcue];
            end
            compim(94:96,:)=0;  %%re-add black line
            
            studytexture = Screen('MakeTexture', w, compim);
            Screen('DrawTexture', w, studytexture);
            t = Screen('Flip', w, t+.5);
            
            %mask 2400ms no cue + 500ms with cue
            maskim = [blankcue; mask; blankcue];
            if strcmp(cue{i}, 'top')
                cuedmask = [topcue; mask; blankcue];
            elseif strcmp(cue{i}, 'bot')
                cuedmask = [blankcue; mask; botcue];
            end
            
            masktexture = Screen('MakeTexture', w, maskim);
            Screen('DrawTexture', w, masktexture);
            t = Screen('Flip', w, t+.5);
            
            cuedmasktexture = Screen('MakeTexture', w, cuedmask);
            Screen('DrawTexture', w, cuedmasktexture);
            t = Screen('Flip', w, t+2.4);
            
            %test object until response (max 3s)
            imtop2 = imread(['stimuli/top/' char(top2_name(i))]);
            imbot2 = imread(['stimuli/bot/' char(bot2_name(i))]);
            if strcmp(cue{i}, 'top')
                testim = [topcue; imtop2(1:63,:,:);imbot2(64:end,:,:); blankcue];
            elseif strcmp(cue{i}, 'bot')
                testim = [blankcue; imtop2(1:63,:,:);imbot2(64:end,:,:); botcue];
            end
            testim(94:96,:)=0;  %%re-add black line
            
            testtexture = Screen('MakeTexture', w, testim);
            Screen('DrawTexture', w, testtexture);
            t = Screen('Flip', w, t+.5);
            
            FlushEvents('keyDown');
            temp = 0;
            rt = GetSecs;
            responsecode = 0;
            
            %record response time
            resp1 = KbName('j');
            resp2 = KbName('k');
            
            GoOn = 0;
            keyIsDown = 0;
            while GoOn == 0;
                temp = GetSecs-rt;
                if temp > 3
                    GoOn = 1;
                end
                [keyIsDown, secs, keyCode] = KbCheck;
                if keyIsDown
                    responsecode = find(keyCode);
                    if responsecode == resp1 | responsecode == resp2
                        keyIsDown = 0;
                        GoOn = 1;
                    end
                    if responsecode == KbName('q')
                        Screen('CloseAll');
                    end
                end
            end
            
            rt = secs-rt;
            rt = rt*1000;
            
            % set correct responses for output file
            if cond(i) == 1 || cond(i) == 4
                congruency = 'C';
            elseif cond(i) == 2 ||cond(i) == 3
                congruency = 'I';
            end
            
            if strcmp(cue{i}, 'top')
                if cond(i) == 1 || cond(i) == 3
                    corrresp = 'same';
                    if responsecode == resp1
                        GradedRes = 1;
                    else
                        GradedRes = 0;
                    end
                elseif cond(i) == 2 || cond(i) == 4
                    corrresp = 'diff';
                    if responsecode == resp2
                        GradedRes = 1;
                    else
                        GradedRes = 0;
                    end
                end
            end
            if strcmp(cue{i}, 'bot')
                if cond(i) == 1 || cond(i) == 2
                    corrresp = 'same';
                    if responsecode == resp1
                        GradedRes = 1;
                    else
                        GradedRes = 0;
                    end
                elseif cond(i) == 3 || cond(i) == 4
                    corrresp = 'diff';
                    if responsecode == resp2
                        GradedRes = 1;
                    else
                        GradedRes = 0;
                    end
                end
            end
            
            if responsecode == resp1
                resp = 'same';
            elseif responsecode == resp2
                resp = 'diff';
            else
                resp = 'timeout';
            end
            
            fprintf(dataFile1, '%d\t%i\t%s\t%s\t%s\t%s\t%s\t%i\t%c\t%s\t%s\t%s\t%s\t%i\t%f\n', str2double(subjno), i, num2str(category), char(top1_name(i)), char(bot1_name(i)), char(top2_name(i)), char(bot2_name(i)), cond(i), congruency, char(align(i)), char(cue(i)), char(corrresp), char(resp), GradedRes, rt);
            
            Screen('Close', studytexture);
            Screen('Close', testtexture);
            Screen('Close', masktexture);
            Screen('Close', cuedmasktexture);
        end
        
 
    Screen('Flip', w);
    center_text(w, 'You have finished this task!', 0);
    center_text(w, 'Press the spacebar', 0, 50);
    Screen('Flip', w);
    WaitSecs(.2);
    responsecode = [];
    temp = 0;
    responsecode = 0;
    
    % Press any key to quit the program
    FlushEvents('keyDown');
    pressKey = KbWait;
    
    ShowCursor;
    Screen('CloseAll');
        ListenChar;
        Screen('CloseAll');
        
catch
    ListenChar(0);
    ShowCursor;
    %Screen('CloseAll');
    rethrow(lasterror);
end
end

