for j = 1:1
    outfile1 = fopen(['3_practice.txt'], 'w');
    outfile2 = fopen(['3_trials.txt'], 'w');
    
    topim = dir('trial_top/*.tif');
    botim = dir('trial_bot/*.tif');
    topcue = 'top';
    botcue = 'bot';
    
    %practice trials
    ntrials = 16;
    cond = [ones(ntrials/8, 1)' 2*ones(ntrials/8, 1)' 3*ones(ntrials/8, 1)' 4*ones(ntrials/8, 1)' 5*ones(ntrials/8, 1)' 6*ones(ntrials/8, 1)' 7*ones(ntrials/8, 1)' 8*ones(ntrials/8, 1)' 9*ones(ntrials/8, 1)' 10*ones(ntrials/8, 1)' 11*ones(ntrials/8, 1)' 12*ones(ntrials/8, 1)' 13*ones(ntrials/8, 1)' 14*ones(ntrials/8, 1)' 15*ones(ntrials/8, 1)' 16*ones(ntrials/8, 1)'];
    %disp(cond');
    cond = cond';
    cond = shuffle(cond);
    
    for i = 1:ntrials
        if cond(i) == 1 %condition 1 both same, top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, topcue, 1, 'A');
        elseif cond(i) == 2 %condition 2 top different bottom same top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, topcue, 2, 'A');
        elseif cond(i) == 3 %condition 3 top same bottom different top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, topcue, 3, 'A');
        elseif cond(i) == 4 %condition 4 top both different top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, topcue, 4, 'A');
        elseif cond(i) == 5 %condition 1 both same, top cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, topcue, 1, 'R');
        elseif cond(i) == 6 %condition 2 top different bottom same top cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, topcue, 2, 'R');
        elseif cond(i) == 7 %condition 3 top same bottom different top cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, topcue, 3, 'R');
        elseif cond(i) == 8 %condition 4 top both different top cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, topcue, 4, 'R');
        elseif cond(i) == 9 %condition 1 both same, bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, botcue, 1, 'A');
        elseif cond(i) == 10 %condition 2 top different bottom same bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, botcue, 2, 'A');
        elseif cond(i) == 11 %condition 3 top same bottom different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, botcue, 3, 'A');
        elseif cond(i) == 12 %condition 4 top both different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, botcue, 4, 'A');
        elseif cond(i) == 13 %condition 1 both same, bot cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, botcue, 1, 'R');
        elseif cond(i) == 14 %condition 2 top different bottom same bot cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, botcue, 2, 'R');
        elseif cond(i) == 15 %condition 3 top same bottom different bot cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, botcue, 3, 'R');
        elseif cond(i) == 16 %condition 4 top both different bot cue RISE
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, botcue, 4, 'R');        
        end
    end
    
    
    
    %experimental trials
    ntrialsALL = 384;
    ntrials = 64;
    cond1 = [ones(ntrials/8, 1)' 2*ones(ntrials/8, 1)' 3*ones(ntrials/8, 1)' 4*ones(ntrials/8, 1)' 5*ones(ntrials/8, 1)' 6*ones(ntrials/8, 1)' 7*ones(ntrials/8, 1)' 8*ones(ntrials/8, 1)'];
    cond1 = cond1';
    cond1 = shuffle(cond1);
    
    cond2 = [9*ones(ntrials/8, 1)' 10*ones(ntrials/8, 1)' 11*ones(ntrials/8, 1)' 12*ones(ntrials/8, 1)' 13*ones(ntrials/8, 1)' 14*ones(ntrials/8, 1)' 15*ones(ntrials/8, 1)' 16*ones(ntrials/8, 1)'];
    cond2 = cond2';
    cond2 = shuffle(cond2);
    
    cond3 = [ones(ntrials/8, 1)' 2*ones(ntrials/8, 1)' 3*ones(ntrials/8, 1)' 4*ones(ntrials/8, 1)' 5*ones(ntrials/8, 1)' 6*ones(ntrials/8, 1)' 7*ones(ntrials/8, 1)' 8*ones(ntrials/8, 1)'];
    cond3 = cond3';
    cond3 = shuffle(cond3);
    
    cond4 = [9*ones(ntrials/8, 1)' 10*ones(ntrials/8, 1)' 11*ones(ntrials/8, 1)' 12*ones(ntrials/8, 1)' 13*ones(ntrials/8, 1)' 14*ones(ntrials/8, 1)' 15*ones(ntrials/8, 1)' 16*ones(ntrials/8, 1)'];
    cond4 = cond4';
    cond4 = shuffle(cond4);
    
    cond5 = [ones(ntrials/8, 1)' 2*ones(ntrials/8, 1)' 3*ones(ntrials/8, 1)' 4*ones(ntrials/8, 1)' 5*ones(ntrials/8, 1)' 6*ones(ntrials/8, 1)' 7*ones(ntrials/8, 1)' 8*ones(ntrials/8, 1)'];
    cond5 = cond5';
    cond5 = shuffle(cond5);
    
    cond6 = [9*ones(ntrials/8, 1)' 10*ones(ntrials/8, 1)' 11*ones(ntrials/8, 1)' 12*ones(ntrials/8, 1)' 13*ones(ntrials/8, 1)' 14*ones(ntrials/8, 1)' 15*ones(ntrials/8, 1)' 16*ones(ntrials/8, 1)'];
    cond6 = cond6';
    cond6 = shuffle(cond6);
    
    condALL = [cond1; cond2; cond3; cond4; cond5; cond6];
    
    
    for i = 1:ntrialsALL
        if condALL(i) == 1 %condition 1 both same, top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, topcue, 1, 'A');
        elseif condALL(i) == 2 %condition 2 top different bottom same top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, topcue, 2, 'A');
        elseif condALL(i) == 3 %condition 3 top same bottom different top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, topcue, 3, 'A');
        elseif condALL(i) == 4 %condition 4 top both different top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, topcue, 4, 'A');
        elseif condALL(i) == 5 %condition 1 both same, top cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, topcue, 1, 'R');
        elseif condALL(i) == 6 %condition 2 top different bottom same top cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, topcue, 2, 'R');
        elseif condALL(i) == 7 %condition 3 top same bottom different top cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, topcue, 3, 'R');
        elseif condALL(i) == 8 %condition 4 top both different top cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, topcue, 4, 'R');
        elseif condALL(i) == 9 %condition 1 both same, bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, botcue, 1, 'A');
        elseif condALL(i) == 10 %condition 2 top different bottom same bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, botcue, 2, 'A');
        elseif condALL(i) == 11 %condition 3 top same bottom different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, botcue, 3, 'A');
        elseif condALL(i) == 12 %condition 4 top both different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, botcue, 4, 'A');
        elseif condALL(i) == 13 %condition 1 both same, bot cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, botcue, 1, 'R');
        elseif condALL(i) == 14 %condition 2 top different bottom same bot cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, botcue, 2, 'R');
        elseif condALL(i) == 15 %condition 3 top same bottom different bot cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, botcue, 3, 'R');
        elseif condALL(i) == 16 %condition 4 top both different bot cue misaligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, botcue, 4, 'R');        
        end
    end
end    
