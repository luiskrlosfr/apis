module ApplicationHelper

  def regions_combo
    Region.all.map {|r| [r.name, r.id]}
  end

  def level_combo
    [['Principiante', 'novice'], ['Promedio', 'average'], ['Experto', 'expert']]
  end

  def traits_combo
    Trait.all.map {|t| [t.name, t.id]}
  end

  def hours_combo
    SimpleTime.all.map {|st| [st.hour, st.id]}
  end

  def days_combo
    Day.all.map {|d| [d.name.titleize, d.id]}
  end
end
