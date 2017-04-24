cat file | perl -n -e'/hello(:)(.+)/i && print $1. "\n"'
cat file | perl -n -e'/(.+):(.+)/i && print $1. "\n"'

##Split by : and print

cat file | perl -ne 'print join("\n", split(/:/,$_));'

cat file | perl -ne 'print split(/:/,$1);'

cat file | perl -n -e'/(.+):(.+)/i && print "{\"first\":\"" . $1 ."\",\"second\":\"". $2 . "\"},\n"'


##Replace all non number and word characters:

cat file | perl -pne 's/[^a-zA-Z0-9\s]*//g'


##Output as upper case:

cat newfile | perl -nle 'print uc $_'



cat file | perl -ne '@lines=split(/:/,$_);print $lines[0]'

##Split by : and show first value of the split:

cat newfile | perl -ne '@lines=split(/:/,$_);print "$lines[0]" . "\n"'


## Output all text that appears on each line before :

cat newfile | perl -n -e'/(.+):(.+)/i && print $1. "\n"'

## Output all text that appears on each line AFTER :

cat newfile | perl -n -e'/(.+):(.+)/i && print $2. "\n"'



cat dirfile.txt | perl -ne 'print split(/\s/,$1);'


## Convert space seperated to CSV

ls -l / | perl -ne 'print join(",", split(/\s+/,$_)) . "\n";'

## Convert space seperated to TSV

ls -l / | perl -ne 'print join("\t", split(/\s+/,$_)) . "\n";'
