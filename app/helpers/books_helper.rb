module BooksHelper

  def sortable(column)
    direction = change_direction_if_required(column)
    if direction == "ASC"
      link_to(books_path(:sort_by => column, :sort_direction => direction), method: :get) do
        "<i class='fa fa-sort-down' aria-hidden='true'></i>".html_safe
      end
    else
      link_to(books_path(:sort_by => column, :sort_direction => direction), method: :get) do
        "<i class='fa fa-sort-asc' aria-hidden='true'></i>".html_safe
      end
    end
  end

  def change_direction_if_required(column)
    if column == params[:sort_by] && params[:sort_direction] == "ASC"
      "DESC"
    elsif column == params[:sort_by] && params[:sort_direction] == "DESC"
      "ASC"
    else
      "ASC"
    end
  end

end
