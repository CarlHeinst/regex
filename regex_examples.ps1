﻿"Powershell" -match "shell" ##$true
"Powershell" -notmatch "shell" ##$false
"Powershell" -notmatch "cmd" ##$true

"\w" ##match any word character including numbers
"\W" ##match any NON-word character including numbers
"\d" ##match any digit
"\D" ##match any NON-digit
"\s" ##match any white space character
"\S" ##match any NON-white space character
"\b" ##match any word boundary
"[A-z]" ##match any alphabetic character

"Powershell" -match "\w" ##$true
"Powershell" -match "\W" ##$false
"&^%^%&$" -match "\w" ##$false
"Carl" -match "C.rl" ## true because there is one character between C and rl
"Carl" -match "C..rl" ## false because there aren't two characters between C and rl
"Carl" -match "^car" ## true
"I drive a car" -match "^car" ## false because car is not right at the beginning
"powershell" -match "^powershell$" ## true - matches exactly the word powershell
"powershelliscool" -match "^powershell$" ## false - there are extra characters after powershell and we don't want a match of that kind.
"powershell" -match "power$" ##false - there are more characters after power in the string
"ihavehtepower" -match "power$" ##true - the string power appears at the very end so therefore this is true
"1" -match "^[A-z]{0,1}$" ##false we are looking for a single Alphabetic character
"wefr12312" -match "^[A-z]{0,1}$" ##false we are looking for a single Alphabetic character
"A" -match "^[A-z]{0,1}$" ##true, we are looking for a single Alphabetic character

"C:" -match "^[A-z]{0,1}\:$" ##true, we are looking for Alphabetic character and then a : - eg a valid Windows Drive paths such as C:, D: etc.

## quantifiers

"+" ##match repeating instances of preceding charactters
"." ##match any single character
"*" ##match zero or more instances of preceeding character
"?" ##match 0 or 1 instances of preceding characters
"{n}" ##match exactly n number of preceding characters
"{n,}" ##match at least n number of preceding characters
"{n,m}" ##match at least n number of preceding characters and no more than m characters

"023-8081-4272" -match "\d{3}-\d{4}-\d{4}" ##this will be true 3 digits, -, then 4 digits, -, then 4 digits
"0891 35 35 35" -match "\d{4} \d{2} \d{2} \d{2}" ##this will be true: 4 digits, A SPACE, two digits, A SPACE, two digits, A SPACE, two digits, 
"0891 3500 35 35" -match "\d{4} \d{2} \d{2} \d{2}" ##this will be false
"1.1.1.1" -match "\d.\d.\d.\d" ##true
"10.10.10.1" -match "\d.\d.\d.\d" ##false - because it's not One digit.onedigit - it's many digits
"100.100.1.1" -match "\d\d\d.\d\d\d.\d.\d" ## true because it's three digits, three digits and then one and one digit

#### Networking

"10.5.6.89" -match "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" ##true 
"10.5.6.89" -match "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$" ##true 
"10.5.6.8900" -match "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$" ##false, because 8900 is more than 4 characters
"10 5.6.89" -match "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" ##false, although . normally means one character we have escaped these . with \
"10.5.6. 89" -match "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" ##false

#### Networking Evolution:

"10.5.6.89" -match "(\d{1,3}\.){3}(\d{1,3})" ## true because you are saying looking for 3 lots of numbers up to 3 digits long with a . on the end and then one without a .
"B8:08:CF:33:C5:82" -match "(([0-9A-Fa-f]{2})(.*)){4}" ## true, match a Hexadecimal up to two characters long, seperated by anything and there must be 4 of them!

0 -match "^[1-9]$|^[1-4][0-9]$" ## RESULT = FALSe, because the value is less than 1-9, OR it is not 10-49
21 -match "^[1-9]$|^[1-4][0-9]$" ## RESULT = TRUE, because the value is between 1 - 9 OR it is between 10 - 49

"DOMAIN\USERNAME" -match "\w+\\\w+" ##true. A word, a slash, a word
"\\COMPUTER\UNCSHARE" -match "\\\\\w+\\\w+" ##true. two slashes - each one escaped by another slash so \\ \\
1233598 -match "^\d{7}$" ##true - this must be a number 7 digits long

Get-ChildItem "\\SERVER\FILES" -Filter "datareport*.docx" | where {$_.name -match "t\d{2}\.docx$"} ##only returns files like datareport99.docx where there are two digits after the t and before the .docx. Also this must be at the end of the file name
"100" -match "\d[0..100]"
"HEllo" -match "(?i)hello"  ### RESULT: TRUE (?i) starts case-insensitive mode
"HEllo" -match "(?-i)hello" ### RESULT: FALSE (?-i) turns off case-insensitive mode

"Bob,Bob Road,Bob Town,Land of bob" -replace "(?i)^(.*),(.*),(.*),(.*)$", "`$1" ## RESULT: BOB - this defines a pattern of three commas seperating 4 values and returns the first value


$ip = "^10\.\d{1,3}\.10\.\d{1,3}$"
"10.100.10.1","10.192.20.1","10.150.10.1","10.100.10.3","10.100.10.4","10.200.10.1" | where {$_ -match $ip}
## match all IPs 10.X.10.X

$p = "^\\\\[Cc][Hh][Ii]-\w+\d{2}\\\w+$" ## [Cc] look for upper or lower case C or c
$unc = "\\chi-FP01\public"

[regex]$rx = $p
$rx.match($name)

$unc -match $p
$rx.Match($unc.ToUpper())


test-path $rx.Match($name).Value ## this will be $false because although the match is valid test-path on the value of $name is null.

$line = "8.8.8.8`t10.1.1.1`t Error someting wong"
[regex]$ip = "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"
$data = $ip.Matches($line)

[regex]$win = "2012"
$win.Matches((gc '.\SM2 inventory.txt'))
##All matches in a text file.

$skynet = "<@U052T8M35> testing <@U035F5Z99> <@U02ADP8GE> <@U03HCTSCT> - please ignore"
[regex]$slackIDs = "<@\w{9}>"
$slackIDs.Matches($skynet) | foreach value

"Don Jones" -replace "([a-z]+)\s([a-z]+)",'$2, $1'


"<@U07HV9MS8>" -replace "^\W{2}(\w{9})\W$",'$1' ##U07HV9MS8

$tickets = Get-ZDTickets -startdate ((get-date).AddDays(-4)) -normal -high -urgent -problem -incident -Verbose
[regex]$match = "[Ii][Nn][Cc]\d{12}"
$match.matches($tickets.subject)
$tickets | where {$_.subject -match $match} | select id,subject,@{n='INC';e={$matches.values}}

$grabs = "123456789P","CCCC123456789C","UUU123456789U","123456789Z","123456789U","123456789u"
$grabs -match "^\w{9}[Tt|Dd|Uu]" #Matches the 10th character as T, D or U


$gioserv = "server12345.gioserv.com"
if ($gioserv -match "\.")
{
[regex]$firstword = "\d+(?=\.)" ## Match and return any number, until you hit a . character
$firstword.Match($gioserv)
$firstword.Match($gioserv).Value
}
else
{
[regex]$firstword = "\d+" ## Match and return any number, until you hit a . character
$firstword.Match($gioserv)
$firstword.Match($gioserv).Value
}


$crap = "Server		Address		Telephone
Server1 works
Server2 works
Server3 doesn't work"
$crap.Split("`n") |  where {$_ -match "^(?!.*(.*doesn't\swork.*))(^Server.*)"}
## "^(?!.*(.*doesn't\swork.*))(^Server.*)"
## ^(?!.*(.*doesn't\swork.*)) -- Start at the begining of the string and LOOKAHEAD to make sure it DOESN'T MATCH .*doesn't\swork.*
## (^Server.*) Make sure the match DOES start with the word Server

[Regex]::Match("bastardo010999.crap.com", "(?<=010).*?(?=\.)").Value
## Returns value of 999.
##Searches the string for 010 - and returns all charcters after
## then searches ahead for next instance of . and returns only up to that point/


$data = "UKS13456", "UKSE565646", "UKS564", "UKSE89793"
$data -replace "(s|se)([\d+])","RI$2"
