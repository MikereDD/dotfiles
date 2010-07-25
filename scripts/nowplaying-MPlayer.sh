
#!/bin/bash
# Now Playing Mplayer
#
NP="$(cat ~/.mplayer/mylog.log |grep Playing | tail -1 | sed 's/Playing //g;s/[.][^.]*[.]$//')"
echo -e "Watching: $NP"


