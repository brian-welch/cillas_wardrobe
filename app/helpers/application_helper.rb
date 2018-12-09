module ApplicationHelper

  def title
    content_tag(:title, @title || "Cilla's Wardrobe: Unique Fashion Online")
  end

end
