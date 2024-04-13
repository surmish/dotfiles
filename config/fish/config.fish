if status is-interactive

  # set usrDir "/home/scratch.urmishs_vlsi/tools/usr"

  # if not contains $usrDir/bin $PATH
  #   set -gx PATH $usrDir/bin $PATH
  # end
  #
  # if not contains $usrDir/lib $LD_LIBRARY_PATH
  #   # Setting environment variables
  #   set -gx LD_LIBRARY_PATH $usrDir/lib64 $usrDir/lib $LD_LIBRARY_PATH
  # end

  # Commands to run in interactive sessions can go here
  # for zellij
  # export TERM=screen-256color
  export P4DIFF="nvim -d"
  export P4EDITOR=nvim
  # export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANPAGER='nvim +Man!'
  export MANWIDTH=999

  set -g fish_escape_delay_ms 10

  if not functions -q fisher
    echo "Installing Fisher..."
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
  end

  # Check if Fisher is installed
  if functions -q fisher
      # List of desired packages
      set fisher_packages jorgebucaran/fisher ilancosman/tide@v6.1.1 patrickf1/fzf.fish sujaybokil/fish-gruvbox kidonng/zoxide.fish
      # Install each package if not already installed
      for pkg in $fisher_packages
          if not fisher list | string match -q $pkg
              echo "Installing $pkg..."
              fisher install $pkg
          end
      end
  end

  # List of Cargo packages to maintain
  # cargo install bat eza fd-find htop procs ripgrep sd stylua tealdeer tokei ytop zoxide

  function ppl
    echo "PATH:"
    for path in $PATH
        echo $path
    end
    echo

    echo "LD_LIBRARY_PATH:"
    if set -q LD_LIBRARY_PATH
        for ld_path in $LD_LIBRARY_PATH
            echo $ld_path
        end
    else
        echo "LD_LIBRARY_PATH is not set."
    end
  end

  test -f ~/.config/fish/bindings.fish; and source ~/.config/fish/bindings.fish
  test -f ~/.config/fish/aliases.fish; and source ~/.config/fish/aliases.fish
  test -f ~/.config/fish/work.fish; and source ~/.config/fish/work.fish

end
