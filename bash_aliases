source ~/.bashrc.urmish.work

export EDITOR=vim
# export PS1='\[\033[0;35m\]\h\[\033[0;33m\] \w\[\033[00m\]: '
# export PS1='\[\033[40;33;01m\]\h: \[\e[m\]'
export PS1='\[\033[01;33m\]prompt:> \[\e[m\]'

# alias fzf='/u/urmish/usr/local/bin/fzf'

alias ls="ls --color=auto"
alias v="ls -ltr"

alias ealias="vim ~/.bashrc.urmish"
alias salias="source ~/.bashrc.urmish"

# alias fd='/u/urmish/usr/local/bin/fd'
alias lc="wc -l"

alias lg="ls | rg"
alias hig="history | rg"

# alias e="vim"
alias e-="vim -"
# alias vd="vimdiff -o"
# alias vt="vim -t"
# alias r="vim -R"

# function e- () { vim - ; }
function e  () { vim $@ ; }
function eo () { vim -o $@ ; }
function eO () { vim -O $@ ; }
function r  () { vim -R $@ ; }
function vt () { vim -t $@ ; }
function vd () { vimdiff -o $@ ; }
function evim  () { vim ~/.vimrc ; }
function etmux () { vim ~/.tmux.conf ; }

alias tmux="tmux -2"
alias takeover="tmux detach -a"

alias c="cd"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ....="cd ../../../../"

alias rmf="rm -f"
alias rmrf="rm -rf"

alias cpr="cp -r"

alias dus="du -hc --summarize"
alias dfh="df -h ."

alias rp="readlink -e "
alias rp.="readlink -e ."

alias tf='tail -f'

# alias yaudio="youtube-dl --extract-audio --audio-quality 0"

function main_tmux () {
  export DISPLAY=us01odcvde03846:110.0
  if [ -z "$TMUX" ] && [ ${UID} != 0 ]
  then
    tmux new-session -A -s main
  fi
}

function putty_tmux () {
  export DISPLAY=us01odcvde03846:110.0
  if [ -z "$TMUX" ] && [ ${UID} != 0 ]
  then
    tmux new-session -A -s putty
  fi
}

function dirdiff () {
  # Shell-escape each path:
  DIR1=$(printf '%q' "$1"); shift
  DIR2=$(printf '%q' "$1"); shift
  vim $@ -c "DirDiff $DIR1 $DIR2"
}

function topu () { top -u urmish ; }

function efzf () { vim $(fzf -e) ; }

export TERM=xterm-256color
export TLDR_HEADER='yellow bold underline'
# export TLDR_QUOTE='italic'
# export TLDR_DESCRIPTION='green'
# export TLDR_CODE='violet'
# export TLDR_PARAM='yellow'
# export LS_COLORS='rs=0:di=1;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
export LS_COLORS='rs=0:di=1;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30:ow=34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

function compile_vim () { 
  set -x
  ./configure --prefix=/u/urmish/usr/local --with-tclsh=~/usr/local/bin/tclsh --enable-luainterp=yes --with-lua-prefix=/u/urmish/usr/local --disable-terminal --with-features=huge --enable-tclinterp=no --enable-perlinterp=no --disable-cscope --enable-python3interp=dynamic --disable-gui --disable-gpm --disable-xim --disable-fontset --disable-rightleft --disable-arabic --disable-darwin --disable-smack --disable-xsmp -disable-xsmp-interact --disable-gtk2-check --disable-gtktest --disable-acl --disable-canberra
  # make -j16
  # make install
  set +x
}
