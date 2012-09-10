#
#  .cshrc
#
#

# Skip remaining setup if not an interactive shell.
if (${?prompt} == 0) exit
if (X$prompt == "X") exit
if (X$prompt == "X% ") exit

# Examine which shell can use...
foreach shell (/opt/local/zsh4/bin/zsh /bin/zsh /usr/local/bin/zsh /usr/site/bin/zsh /usr/bin/zsh) 

    if ( -x $shell ) then
	echo .cshrc: using $shell as login shell
	setenv SHELL $shell
	setenv KICKED_BY_CSH yes
	exec $shell -l
    endif
end

echo .cshrc: No usable shell. use csh instead.
source ~/.cshrc.orig
