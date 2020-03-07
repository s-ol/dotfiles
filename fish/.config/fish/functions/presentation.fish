function presentation
  function fish_prompt
    set_color -b white black
    echo -n ' $ '
    set_color -b black white
    echo -n ''
    echo -n ' '
    set_color normal
  end
  
  function fish_right_prompt
  end

  alias kak='kak -e presentation'
end
