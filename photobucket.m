% Photobucket scraper
% Matlab script for scraping images off a photobucket album
% utilizes regular expressions and external tool wget

s = urlread('http://s1270.photobucket.com/albums/SERVERNAME/USERNAME/ALBUMNAME/?start=all');

index = regexp(s,'pbthumburl=');

for k=1:length(index)
    tmp=strtrim(s(index(k):index(k)+100));
    tmp=tmp(regexp(tmp,'"','once')+1:end);
    tmp=tmp(1:regexp(tmp,'"','once')-1);
    system(['wget ',tmp(1:regexp(tmp,'th_')-1),tmp(regexp(tmp,'th_')+3:end)]);
end
