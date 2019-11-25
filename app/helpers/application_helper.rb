module ApplicationHelper

  def regions_combo
    Region.all.map {|r| [r.name, r.id]}
  end

  def level_combo
    [['Principiante', 'novice'], ['Promedio', 'average'], ['Experto', 'expert']]
  end

  def traits_combo
    swag = Trait.all.map {|t| [t.name, t.id]}
    puts swag.inspect
    swag
  end
end
