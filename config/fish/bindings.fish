set -g fish_key_bindings fish_vi_key_bindings

bind -M default j  'backward-char'
bind -M default \; 'forward-char'
bind -M default k  ' '
bind -M default l  ' '

for mode in insert default visual
  bind -M $mode \ca 'beginning-of-line'
  bind -M $mode \ce 'end-of-line'
  bind -M $mode \cp 'up-or-search'
  bind -M $mode \cn 'down-or-search'
  bind -M $mode \cj 'execute'
end

for mode in insert default
  bind --erase \e\cf # unbind ctrl + alt + f
  bind -M $mode \cf '_fzf_search_directory'
end
