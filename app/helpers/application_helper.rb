module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), :class => direction, :remote => true
  end
  
  def font_styles
    [["normal", "normal"]] +[["italic", "italic"]] + [["oblique", "oblique"]]
  end  
  
  def font_families
    [["Select Font Family", "" ]] + 
    [["Font Awesome", "FontAwesome"]] + 
    [["<styleLimousineregular", "limousineregular"]] + 
    [["Cast Ironregular", "cast_ironregular"]] + 
    [["Mariana Familyregular", "mariana_familyregular"]] + 
    [["Shady Charactersmedium", "shady_charactersmedium"]] + 
    [["Arcadiaregular", "arcadiaregular"]] + 
    [["Espionageregular", "espionageregular"]] + 
    [["Freezerregular", "freezerregular"]] + 
    [["Funky Clawregular", "funky_clawregular"]] + 
    [["Funky Clawregular", "funky_clawregular"]] + 
    [["Generationregular", "generationregular"]] + 
    [["Gentleman Callerregular", "gentleman_callerregular"]] + 
    [["Rechargebold", "rechargebold"]] + 
    [["Regencielight", "regencielight"]] + 
    [["Smile Paraderegular", "smile_paraderegular"]] + 
    [["Wild West Shadowregular", "wild_west_shadowregular"]] + 
    [["Wild West Windregular", "wild_west_windregular"]] + 
    [["Adelle", "Arial,Sans Serif"]] + 
    [["Arial Black", "Arial Black,Sans Serif"]] +
    [["Arial Narrow", "Arial Narrow,Sans Serif"]] +
    [["Arial Rounded MT Bold", "Arial Rounded MT Bold,Sans Serif"]] +
    [["Avant Garde", "Avant Garde,Sans Serif"]] +
    [["Calibri", "Calibri,Sans Serif"]] +
    [["Candara", "Candara,Sans Serif"]] +
    [["Century Gothic", "Century Gothic,Sans Serif"]] +
    [["Franklin Gothic Medium", "Franklin Gothic Medium,Sans Serif"]] +
    [["Franklin Gothic Medium", "Franklin Gothic Medium,Sans Serif"]] +
    [["Futura", "Futura,Sans Serif"]] +
    [["Geneva", "Geneva,Sans Serif"]] +
    [["Gill Sans", "Gill Sans,Sans Serif"]] +
    [["Helvetica", "Helvetica,Sans Serif"]] +
    [["Impact", "Impact,Sans Serif"]] +
    [["Lucida Grande", "Lucida Grande,Sans Serif"]] +
    [["Optima", "Optima,Sans Serif"]] +
    [["Segoe UI", "Segoe UI,Sans Serif"]] +
    [["Tahoma", "Tahoma,Sans Serif"]] +
    [["Trebuchet MS", "Trebuchet MS,Sans Serif"]] +
    [["Verdana", "Verdana,Sans Serif"]] +    
    [["Baskerville", "Baskerville, Serif"]] +
    [["Big Caslon", "Big Caslon, Serif"]] +
    [["Bodoni MT", "Bodoni MT, Serif"]] +
    [["Book Antiqua", "Book Antiqua, Serif"]] +
    [["Calisto MT", "Calisto MT, Serif"]] +
    [["Cambria", "Cambria, Serif"]] +
    [["Didot", "Didot, Serif"]] +
    [["Garamond", "Garamond, Serif"]] +
    [["Georgia", "Georgia, Serif"]] +
    [["Goudy Old Style", "Arial, Serif"]] +
    [["Goudy Old Style", "Goudy Old Style, Serif"]] +
    [["Hoefler Text", "Hoefler Text, Serif"]] +
    [["Lucida Bright", "Lucida Bright, Serif"]] +
    [["Palatino", "Palatino, Serif"]] +
    [["Perpetua", "Perpetua, Serif"]] +
    [["Rockwell", "Rockwell, Serif"]] +
    [["Rockwell Extra Bold", "Rockwell Extra Bold, Serif"]] +
    [["Times New Roman", "Times New Roman, Serif"]] +
    [["Andale Mono", "Andale Mono ,Monospaced"]] +
    [["Consolas", "Consolas ,Monospaced"]] +
    [["Courier New", "Courier New ,Monospaced"]] +
    [["Lucida Console", "Lucida Console ,Monospaced"]] +
    [["Lucida Sans Typewriter", "Lucida Sans Typewriter ,Monospaced"]] +
    [["Monaco", "Monaco ,Monospaced"]] +
    [["Copperplate", "Copperplate ,Fantasy"]] +
    [["Papyrus", "Papyrus ,Fantasy"]]
  end
end
