module ApplicationHelper
  def page_title
    title = "Hirobook" 
    title = @page_title + " | " + title if @page_title
    title
  end
  
  def page_class
    pageClass = @page_class
    pageClass
  end
end
