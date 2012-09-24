#! /bin/bash
#
# shell.ex - an example shell script.
#


cmdline='copy-dir original-dir'

source ~rclayton/bin/shell-utils


begin=1000
incr=1000
end=11000
scale=0.0002

while getopts b:i:e:s: opt ; do
  case $opt in
    -b*) begin=$(expr $1 : '-b\(..*\)')
	 (( $? == 0 )) || {
	   (( $# > 1 )) || badcmd "Missing -b argument"
	   shift 1
	   begin=$1
	   }
	 ;;
    i) incr=$OPTARG  ;;
    e) end=$OPTARG   ;;
    s) scale=$OPTARG ;;
    ?) badcmd
  esac
done

if [[ ! -r grades ]] ; then
  co grades
  delete=1
fi

(echo Wgrades.txt ; echo q) | sc grades

[[ "delete" ]] && rm -f grades


# $Log: shell.ex,v $
# Revision 1.1.1.1  2006-01-08 19:56:44  rclayton
# Created
#
# Revision 1.9  2005-12-16 03:15:35  rclayton
# Replace $HOME with ~rclayton so root won't freak.
#
# Revision 1.8  2005-12-15 02:04:00  rclayton
# shell-utils is in bin, not lib.
#
# Revision 1.7  2005/11/24 01:37:25  rclayton
# Use shell-utils.
#
# Revision 1.6  2005/10/25 19:52:54  rclayton
# Add an example of do-it-yourself option argument handling.
#
# Revision 1.5  2005/09/05 22:39:29  rclayton
# Added the source-exit code.
#
# Revision 1.4  2005/06/30 15:53:55  rclayton
# Call badcmd on unrecognized options.
#
# Revision 1.3  2005/03/08 02:44:54  rclayton
# \n stopped working in echo output; use separate echo commands.
#
# Revision 1.2  2004/11/14 03:56:46  rclayton
# Switch from ksh to bash.
#
