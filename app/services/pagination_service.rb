class PaginationService < ApplicationService
  include Rails.application.routes.url_helpers

  attr_reader :cursor, :current_page, :per_page, :path

  def initialize(cursor:, current_page:, per_page:, path:)
    @cursor = cursor
    @current_page = current_page
    @per_page = per_page
    @path = path
  end

  def call
    skip = (current_page - 1) * per_page
    total_pages = (cursor.count / per_page.to_f).ceil
    {
      cursor: cursor.limit(per_page).skip(skip),
      options: {
        links: {
          first: send(path, page: 1, per_page:),
          self: send(path, page: current_page, per_page:),
          last: send(path, page: total_pages, per_page:)
        }
      }
    }
  end
end
