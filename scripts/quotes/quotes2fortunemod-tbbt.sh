#!/bin/bash
#
# Simple & Dirty script to convert The Big Bang Theory Quotes Site into fortune-mod files
#
# by: MikeRedd
#
VER="0.3"
#
##

# This script uses Elinks, Cat and Sed
#   Elinks  -  http://elinks.cz/
#   Cat     -  http://www.linfo.org/cat.html
#   Sed     -  http://www.gnu.org/software/sed
#   Head    -  http://en.wikipedia.org/wiki/Head_(Unix)
#   Tail    -  http://en.wikipedia.org/wiki/Tail_(Unix)
##

#error handling
error_msg(){
    echo "$PROG: ERROR: $*" | fold >&2
    }

# Checks
if [[ -z $( type -p elinks ) ]]; then 
  echo -e "elinks -- NOT INSTALLED !";exit
elif [[ -z $( type -p sed ) ]]; then
    echo -e "sed -- NOT INSTALLED !";exit
fi
##

# Directories
QtoFmodDIR="$HOME/tmp/fortunemod"
INDEXDUMP="$QtoFmodDIR/indexdump"
FMREADYFILE="$QtoFmodDIR/fmready"
FETCHDIR="$QtoFmodDIR/fetchlist"
URLFILE="$FETCHDIR/urls.txt"
TMPDIR="$QtoFmodDIR/tmp"
##

# Application Aliases
ELINKS=`which elinks`
AWK=`which awk`
CAT=`which cat`
GREP=`which grep`
HEAD=`which head`
SED=`which sed`
TAIL=`which tail`
##

# Elinks dump's dump-width, change if needed.
DW="100"
##

# Fetchlist Help
TOTALURLS="$($CAT -n $URLFILE | $TAIL -1 | $AWK '{print $1}')"
EPISODE="$($CAT "$URLFILE" | $HEAD -1 | $AWK '{print $1}')"
URL="$($CAT "$URLFILE" | $HEAD -1 | $AWK '{print $2}')"

# URLs from file
IFURLS="$($CAT $URLFILE)"
if [ "$IFURLS" != "" ];  then
   echo -e "URLs found on list: ($TOTALURLS)"
   echo " starting the dump conversion by urlfile now.."
#$CAT "$URLFILE" | $AWK '{print $2}' | while read URL ; do $ELINKS -dump "${URL}" > $INDEXDUMP/${EPISODE}-dump.txt ;
   echo -e "$EPISODE"
  for x in $URL
 do
  $ELINKS -dump -dump-width $DW $x > $INDEXDUMP/${EPISODE}-dump.txt
   echo " file was dumped now let's start the conversion to a fortune-mod file"
HEADLINE=`expr $($CAT -n $INDEXDUMP/${EPISODE}-dump.txt | $GREP "Quotes >" | $TAIL -1 | $AWK '{print $1}') - 6`
   echo "$HEADLINE"
TAILLINE=`expr $HEADLINE - $($CAT -n $INDEXDUMP/${EPISODE}-dump.txt | $GREP "Air Date" | $HEAD -1 | $AWK '{print $1}') - 1`
   echo "$TAILLINE"
   echo " converting dumped html file to a fortune-mod usable file"
  $CAT $INDEXDUMP/${EPISODE}-dump.txt | $HEAD -${HEADLINE} | $TAIL -${TAILLINE} | $SED 's|Rate this quote:||g;s|\[[^]]*\]Tweet||g;s|   ||g;/^[0-9]\+[.]*[0-9]*$/d' | $SED '$!N; /^\(.*\)\n\1$/!P; D' | $SED 's/^$/%/g' > $FMREADYFILE/${EPISODE}-fmready.txt
   echo "removing the url line that was dumped."
RMLINE="$(expr $($CAT -n $URLFILE | $TAIL -1 | $AWK '{print $1}') - 1)"
  $TAIL -${RMLINE}  $URLFILE > $TMPDIR/tmpurllist.txt
  $CAT $TMPDIR/tmpurllist.txt > $URLFILE
   echo "Done..."
  done
else
# Url
URL=$1
 if [ -z "$URL" ]; then
    echo " Provide a url - (Ex: http://the-big-bang-theory.com/quotes/episode/102/The-Big-Bran-Hypothesis/ )"
 else
    unset response
    echo " Please enter an Episode number or name the file something."
 read EPISODE
    $ELINKS -dump -dump-width $DW "$URL" > $INDEXDUMP/${EPISODE}-dump.txt
    echo " file was dumped now let's start the conversion to a fortune-mod file"
 HEADLINE=`expr $($CAT -n $INDEXDUMP/${FNAME}-dump.txt | $GREP "Quotes >" | $TAIL -1 | $AWK '{print $1}') - 6`
    echo "$HEADLINE"
 TAILLINE=`expr $HEADLINE - $($CAT -n $INDEXDUMP/${FNAME}-dump.txt | $GREP "Air Date" | $HEAD -1 | $AWK '{print $1}') - 1`
    echo "$TAILLINE"
    echo " converting dumped html file to a fortune-mod usable file"
 $CAT $INDEXDUMP/${FNAME}-dump.txt | $HEAD -${HEADLINE} | $TAIL -${TAILLINE} | $SED 's|Rate this quote:||g;s|\[[^]]*\]Tweet||g;s|   ||g;/^[0-9]\+[.]*[0-9]*$/d' | $SED '$!N; /^\(.*\)\n\1$/!P; D' | $SED 's/^$/%/g' > $FMREADYFILE/${FNAME}-fmready.txt
    echo " done.. "

   fi
fi

######
