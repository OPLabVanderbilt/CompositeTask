%%%%%%%%%%%%%%%%%%%%%%%%%
%% IDEAL composite data
%% collapsed across part
%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; 
files = dir('Complete_Data_C/*.txt');
outfile1 = fopen('C_data.txt', 'w');


for q = 1:size(files, 1)
    [subjectno trial cat topim1 botim1 topim2 botim2 cond cong align cuedpart corr resp gradedres rt] = textread (['Complete_Data_C/' char(files(q).name)], '%u %u %u %s %s %s %s %u %c %c %s %s %s %u %f'); 

    CntrialsRT = 0;
    IntrialsRT = 0;
    CntrialsHIT = 72;
    CntrialsFA = 72;
    IntrialsHIT = 72;
    IntrialsFA = 72;
    
    hitC = 0;
    hitI = 0;
    faC = 0;
    faI = 0;
    
    CsumRT = 0;
    IsumRT = 0;
    
    timeout = 0;
    
    for k = 1:size(subjectno, 1)
        
        %remove time out trials
        if strcmp(resp{k}, 'timeout')
            timeout = timeout + 1;
            if cong(k) == 'C'
                if strcmp(corr{k}, 'same')
                    CntrialsHIT = CntrialsHIT - 1;
                elseif strcmp(corr{k}, 'diff')
                    CntrialsFA = CntrialsFA - 1;
                end
            elseif cong(k) == 'I'
                if strcmp(corr{k}, 'same')
                    IntrialsHIT = IntrialsHIT - 1;
                elseif strcmp(corr{k}, 'diff')
                    IntrialsFA = IntrialsFA - 1;
                end
            end
        end
        
        if cong(k) == 'C'
            if gradedres(k) == 1
                CsumRT = CsumRT + rt(k);
                CntrialsRT = CntrialsRT + 1;
                if strcmp(corr{k}, 'same')
                    hitC = hitC + 1;
                end
            elseif gradedres(k) == 0
                if strcmp(corr{k}, 'diff')
                    faC = faC + 1;
                end
            end
        end
        
        if cong(k) == 'I'
            if gradedres(k) == 1
                IsumRT = IsumRT + rt(k);
                IntrialsRT = IntrialsRT + 1;
                if strcmp(corr{k}, 'same')
                    hitI = hitI + 1;
                end
            elseif gradedres(k) == 0
                if strcmp(corr{k}, 'diff')
                    faI = faI + 1;
                end
            end
        end
        
    end
    
    %get rid of 0/100
    if hitC == 0; hitC = 0.5; elseif hitC/CntrialsHIT == 1; hitC = hitC - 0.5; end;
    if faC == 0; faC = 0.5; elseif faC/CntrialsFA == 1; faC = faC - 0.5; end;
    if hitI == 0; hitI = 0.5; elseif hitI/IntrialsHIT == 1; hitI = hitI - 0.5; end;
    if faI == 0; faI = 0.5; elseif faI/IntrialsFA == 1; faI = faI - 0.5; end;
    
    %calculate d'   
    AC = (norminv(hitC/CntrialsHIT))-(norminv(faC/CntrialsFA));
    AI = (norminv(hitI/IntrialsHIT))-(norminv(faI/IntrialsFA));
    HP_dprime = AC - AI;
    
    %calculate correct RT
    CRT = CsumRT/CntrialsRT;
    IRT = IsumRT/IntrialsRT;
    HP_RT = IRT - CRT;
    
    fprintf(outfile1, '%i\t%i\t%f\t%f\t%f\t%f\t%f\t%f\t%i\n', subjectno(1), cat(1), AC, AI, HP_dprime, CRT, IRT, HP_RT, timeout);
    
end