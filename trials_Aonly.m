for j = 1:1
    outfile1 = fopen(['4_practice.txt'], 'w');
    outfile2 = fopen(['4_trials.txt'], 'w');
    
    topim = dir('stimuli/use/top/*.tif');
    botim = dir('stimuli/use/bot/*.tif');
    topcue = 'top';
    botcue = 'bot';
    
    %practice trials
    ntrials = 8;
    cond = [ones(ntrials/8, 1)' 2*ones(ntrials/8, 1)' 3*ones(ntrials/8, 1)' 4*ones(ntrials/8, 1)' 5*ones(ntrials/8, 1)' 6*ones(ntrials/8, 1)' 7*ones(ntrials/8, 1)' 8*ones(ntrials/8, 1)'];
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
        elseif cond(i) == 5 %condition 1 both same, bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, botcue, 1, 'A');
        elseif cond(i) == 6 %condition 2 top different bottom same bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, botcue, 2, 'A');
        elseif cond(i) == 7 %condition 3 top same bottom different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, botcue, 3, 'A');
        elseif cond(i) == 8 %condition 4 top both different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile1, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, botcue, 4, 'A');        
        end
    end
    
    
    
    %experimental trials
    ntrialsALL = 288;
    cond = [ones(ntrialsALL/8, 1)' 2*ones(ntrialsALL/8, 1)' 3*ones(ntrialsALL/8, 1)' 4*ones(ntrialsALL/8, 1)' 5*ones(ntrialsALL/8, 1)' 6*ones(ntrialsALL/8, 1)' 7*ones(ntrialsALL/8, 1)' 8*ones(ntrialsALL/8, 1)'];
    %disp(cond');
    cond = cond';
    cond = shuffle(cond);
    
    for i = 1:ntrialsALL
        if cond(i) == 1 %condition 1 both same, top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, topcue, 1, 'A');
        elseif cond(i) == 2 %condition 2 top different bottom same top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, topcue, 2, 'A');
        elseif cond(i) == 3 %condition 3 top same bottom different top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, topcue, 3, 'A');
        elseif cond(i) == 4 %condition 4 top both different top cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, topcue, 4, 'A');
        elseif cond(i) == 5 %condition 1 both same, bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot1_index).name, botcue, 1, 'A');
        elseif cond(i) == 6 %condition 2 top different bottom same bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1; while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot1_index).name, botcue, 2, 'A');
        elseif cond(i) == 7 %condition 3 top same bottom different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top1_index).name, botim(bot2_index).name, botcue, 3, 'A');
        elseif cond(i) == 8 %condition 4 top both different bot cue aligned
            top1_index = floor(rand*size(topim, 1))+1;
            bot1_index = floor(rand*size(botim, 1))+1;
            top2_index = floor(rand*size(topim, 1))+1;while top2_index==top1_index; top2_index=floor(rand*size(topim, 1))+1; end
            bot2_index = floor(rand*size(botim, 1))+1;while bot2_index==bot1_index; bot2_index=floor(rand*size(botim, 1))+1; end
            fprintf(outfile2, '%i\t%s\t%s\t%s\t%s\t%s\t%i\t%s\n', i, topim(top1_index).name, botim(bot1_index).name, topim(top2_index).name, botim(bot2_index).name, botcue, 4, 'A');        
        end
    end
end