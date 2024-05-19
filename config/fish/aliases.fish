set SCRATCH_VLSI "/home/scratch.urmishs_vlsi"

# Navigation
abbr ..    'cd ..'
abbr ...   'cd ../..'
abbr ....  'cd ../../..'
abbr ..... 'cd ../../../..'
abbr cdh   'cd ~'

# perforce
abbr p4e       'p4 edit'
abbr p4d       'p4 diff'
abbr p4s       'p4 submit'
abbr p4r       'p4 revert'
abbr p4c       'p4 changes'
abbr p4cl      'p4 changelist'
abbr p4b       'p4 branch'
abbr p4bl      'p4 branches'
abbr p4i       'p4 integrate'
abbr p4res     'p4 resolve'
abbr p4sh      'p4 shelve'
abbr p4ush     'p4 unshelve'
abbr p4si      'p4 sync'
abbr p4cln     'p4 client'
abbr p4u       'p4 user'
abbr p4g       'p4 group'
abbr p4jobs    'p4 jobs'
abbr p4f       'p4 filelog'
abbr p4o       'p4 opened'
abbr p4l       'p4 labels'
abbr p4la      'p4 label'
abbr p4t       'p4 tag'
abbr p4ft      'p4 fstat'
abbr p4descr   'p4 describe'
abbr p4h       'p4 help'
abbr p4pr      'p4 print'
abbr p4lg      'p4 logtail'
abbr p4k       'p4 keys'
abbr p4ck      'p4 counter'
abbr p4lblsync 'p4 labelsync'

# Editing
function e;  $EDITOR $argv; end
function eo; $EDITOR -o $argv; end
function eO; $EDITOR -O $argv; end
function et; $EDITOR -t $argv[1]; end
function r;  $EDITOR -R $argv; end
function vd; $EDITOR -d $argv; end
function vs; $SCRATCH_VLSI/tools/usr/bin/vd $argv; end
abbr e- '$EDITOR -'
abbr p  'pwd'

# Listing and file management
function v;  eza -l --sort=newest $argv; end
function l;  ls --color=auto -CF; end
function ll; eza -l $argv; end
function la; eza -A $argv; end

# Miscellaneous commands
function rmf;  rm -f  $argv; end
function rmrf; rm -rf $argv; end
function g;    rg $argv; end
function envg; env | rg $argv; end
function hig;  history | rg $argv; end
function lg;   eza | rg $argv; end
function tf;   tail -f $argv; end
function rp;   realpath $argv; end
function lc;   wc -l $argv; end
function topu; top -u $USER; end
function cds;  cd $SCRATCH_VLSI; end
function cdc;  cd $SCRATCH_VLSI/clients; end
function cdt;  cd $SCRATCH_VLSI/tools; end

# System and process management
function dfh; df -h $argv; end
function duh; du -h $argv; end
function dus; du -hc --summarize $argv; end
function psg; ps aux | rg $argv; end

function fdf; fd --type=f $argv; end
function fdd; fd --type=d $argv; end

function mkcd
    if mkdir -p $argv[1]
        cd $argv[1]
    else
        echo "Failed to create directory: $argv[1]"
    end
end

# Editing and Sourcing Configuration Files:
function evim;    $EDITOR ~/.vimrc; end
function ecsh;    $EDITOR ~/.cshrc_custom; end
function scsh;    source  ~/.cshrc_custom; end
function efish;   $EDITOR $__fish_config_dir/config.fish; end
function sfish;   source  $__fish_config_dir/config.fish; end
function ealias;  $EDITOR $__fish_config_dir/aliases.fish; end
function salias;  source  $__fish_config_dir/aliases.fish; end
function ezellij; $EDITOR ~/.config/zellij/config.kdl; end

function cargo-update; cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' '); end

abbr x 'extract'
function extract
  if test -f $argv[1]
    switch $argv[1]
      case '*.tar.bz2'
      	tar xjf $argv[1]
      case '*.tar.gz'
        tar xzf $argv[1]
      case '*.tar.xz'
        tar xJf $argv[1]
      case '*.tar.lzma'
        tar --lzma -xf $argv[1]
      case '*.bz2'
        bunzip2 $argv[1]
      case '*.rar'
        unrar x $argv[1]
      case '*.gz'
        gunzip $argv[1]
      case '*.tar'
        tar xf $argv[1]
      case '*.tbz2'
        tar xjf $argv[1]
      case '*.tgz'
        tar xzf $argv[1]
      case '*.zip'
        unzip $argv[1]
      case '*.Z'
        uncompress $argv[1]
      case '*.7z'
        7z x $argv[1]
      case '*'
        echo "'$argv[1]' cannot be extracted via extract"
    end
  else
  	echo "'$argv[1]' is not a valid file"
  end
end

function dirdiff
  # Check if two arguments are provided
  if test (count $argv) -ne 2
    echo "Usage: dirdiff dir1 dir2"
    return 1
  end

  # Shell-escape each path and store them in variables
  set DIR1 (string escape -- $argv[1])
  set DIR2 (string escape -- $argv[2])

  # Open Vim with DirDiff
  nvim -c "DirDiff $DIR1 $DIR2"
end

function ewhere -d "Open a file from a Perforce depot path in Neovim"
     # Strip revision number if present (format: //depot/path/file#rev)
    set depotPath (string replace -r '#[0-9]+$' '' $argv)

    # Run p4 where command and capture the output
    set output (p4 where $depotPath)

    # Extract the local file path from the output
    # Assuming the output format is depotPath clientPath localPath
    set localPath (echo $output | string split " ")[3]

    # Check if the file path was extracted successfully
    if test -n "$localPath"
        # Open the file in Neovim
        nvim $localPath
    else
        echo "Could not find local path for $argv"
    end
end
