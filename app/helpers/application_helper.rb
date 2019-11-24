module ApplicationHelper

  def regions_combo
    Region.all.map {|r| [r.name, r.id]}
  end
end
