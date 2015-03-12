% script to make or load DoWalphaJmbj6.
alpname = 'pairsmbj';
if ~exist(alpname, 'var') % check if alpha is already in workspace.
    if exist([alpname '.mat'], 'file')
        load(['ALPHAS/' alpname]);
    else % make the alpha from scratch.
        fhpair = str2func([alpname '_f']);
        eval([alpname '= fhpair(P_scaledf96, dailymodel, vols,' ...
    'gmtTradingTimes, tradetimes);']);
        
        save(['ALPHAS/' alpname], alpname);
    end
else
    disp(['Using alpha ' alpname ' that already exists in the workspace.'])
end