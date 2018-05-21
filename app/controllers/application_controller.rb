class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :sort_column, :sort_direction

  private

  def tasks
    if params[:type] == 'mytask'
       current_user.tasks.order("#{sort_column} #{sort_direction}")
     else
       Task.includes(:user).order("#{sort_column} #{sort_direction}")
     end
  end

  def sortable_columns
    %w[name due_date priority]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
