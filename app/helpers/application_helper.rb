module ApplicationHelper
  def title(page_title)
    base_title = 'Macro Share'
    if page_title.empty?
      base_title
    else
      page_title + '| Macro Share'
    end
  end
end
