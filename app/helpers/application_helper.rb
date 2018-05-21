module ApplicationHelper
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = if column == sort_column && sort_direction == 'asc'
                  'desc'
                else
                  'asc'
                end
    icon = sort_direction == 'asc' ? 'fa fa-arrow-up' : 'fa fa-arrow-down'
    icon = column == sort_column ? icon : ''
    link_to "#{title} <span class='#{icon}'></span>".html_safe,
            column: column, direction: direction, type: params[:type]
  end

  def render_check(task)
    icon = task.doit ? 'fa fa-check-square-o' : 'fa fa-square-o'
    "<span class='#{icon}'></span>"
  end
end
