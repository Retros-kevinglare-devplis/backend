class PaginationService < ApplicationService
  include Rails.application.routes.url_helpers

  attr_reader :cursor, :current_page, :per_page, :path, :path_ids

  def initialize(cursor:, current_page:, per_page:, path:, path_ids: nil)
    @cursor = cursor
    @current_page = current_page
    @per_page = per_page
    @path = path
    @path_ids = path_ids
  end

  def call
    skip = (current_page - 1) * per_page
    total_pages = (cursor.count / per_page.to_f).ceil
    {
      cursor: cursor.limit(per_page).skip(skip),
      options: {
        links: {
          first: send(*([path, path_ids, page: 1, per_page:].compact_blank.flatten)),
          self: send(*([path, path_ids, page: current_page, per_page:].compact_blank.flatten)),
          last: send(*([path, path_ids, page: total_pages, per_page:].compact_blank.flatten))
        }
      }
    }
  end
end
