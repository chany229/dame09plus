# -*- encoding : utf-8 -*-
class PaginateLinkRenderer < WillPaginate::ActionView::LinkRenderer
  protected

    def page_number(page)
      unless page == current_page
        tag(:span, link(page, page, :rel => rel_value(page), 'data-remote' => true))
      else
        tag(:span, page, :class => "current")
      end
    end
    
    def previous_or_next_page(page, text, classname)
      if page
        tag(:span, link(text, page, 'data-remote' => true), :class => classname)
      else
        tag(:span, text, :class => classname + ' disabled')
      end
    end
end