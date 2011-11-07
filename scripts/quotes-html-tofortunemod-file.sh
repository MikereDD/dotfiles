#!/bin/bash
#
# Simple & Dirty script to convert The Big Bang Theory Quotes Site into fortune-mod files
#
# by: MikeRedd
#
VER="0.1"
#
##

# This script uses Elinks, Cat and Sed
#   Elinks  -  http://elinks.cz/
#   Cat     -  http://www.linfo.org/cat.html
#   Sed     -  http://www.gnu.org/software/sed
#   Head    -  http://en.wikipedia.org/wiki/Head_(Unix)
#   Tail    -  http://en.wikipedia.org/wiki/Tail_(Unix)
##

# Checks
if [[ -z $( type -p elinks ) ]]; then 
  echo -e "elinks -- NOT INSTALLED !";exit
elif [[ -z $( type -p sed ) ]]; then
    echo -e "sed -- NOT INSTALLED !";exit
fi
##

# Directories
INDEXDUMP="$HOME/tmp/fortunemod/indexdump"
FMREADYFILE="$HOME/tmp/fortunemod/fmready"
##

# Application Aliases
ELINKS="/usr/bin/elinks"
CAT="/bin/cat"
SED="/bin/sed"
HEAD="/usr/bin/head"
TAIL="/usr/bin/tail"
##

# Url
URL=$1
if [ -z "$URL" ]; then
   echo " Provide a url - (Ex: http://the-big-bang-theory.com/quotes/episode/102/The-Big-Bran-Hypothesis/ )"
else
   unset response
  echo " Let's name the file we are about to dump"
  read FNAME
   $ELINKS -dump "$URL" > $INDEXDUMP/${FNAME}-dump.txt
  echo " file was dumped now let's start the conversion to a fortune-mod file"
   HEADLINE=`expr $($CAT -n $INDEXDUMP/${FNAME}-dump.txt | grep "Quotes >" | tail -1 | awk '{print $1}') - 6`
#  echo "$HEADLINE"
   TAILLINE=`expr $HEADLINE - $($CAT -n $INDEXDUMP/${FNAME}-dump.txt | grep "Air Date" | head -1 | awk '{print $1}') - 1`
#  echo "$TAILLINE"
  echo " converting dumped html file to a fortune-mod usable file"
   $CAT $INDEXDUMP/${FNAME}-dump.txt | head -${HEADLINE} | tail -${TAILLINE} | sed 's|Rate this quote:||g;s|\[[^]]*\]Tweet||g;s|   ||g;/^[0-9]\+[.]*[0-9]*$/d' | sed '$!N; /^\(.*\)\n\1$/!P; D' | sed 's/^$/%/g' > $FMREADYFILE/${FNAME}-fmready.txt
  echo " done.. "

fi
