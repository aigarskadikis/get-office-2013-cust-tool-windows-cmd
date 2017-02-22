@echo off
set path=%path%;%~dp0
for /f "tokens=*" %%a in ('^
wget --no-cookies --no-check-certificate -qO- "https://www.microsoft.com/en-us/search/Results.aspx?q=Office 2013 Administrative Template files" --user-agent="Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)" ^|
sed "s/\d034/\n/g" ^|
grep "^http.*en-us.*download.*details" ^|
gnusort ^|
uniq ^|
sed "s/details/confirmation/"') do (
echo %%a
for /f "tokens=*" %%b in ('^
wget --no-cookies --no-check-certificate -qO- "%%a" --user-agent="Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)" ^|
sed "s/\d034/\n/g" ^|
grep "^http.*exe" ^|
gnusort ^|
uniq') do wget %%b
)
pause
