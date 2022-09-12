module Pagination
  def current_page
    parsing_pagination_params(key: :page, count: 1)
  end

  def per_page
    parsing_pagination_params(key: :per_page, count: 20)
  end

  private

  def parsing_pagination_params(key:, count:)
    params[key].present? ? params[key].to_i : count
  end
end
