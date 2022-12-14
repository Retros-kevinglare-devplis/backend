# frozen_string_literal: true

# Конвертируем ключи входящих параметров из CamelCase в snake_case

ActionDispatch::Request.parameter_parsers[:json] = lambda { |raw_post|
  data = ActiveSupport::JSON.decode(raw_post)
  data = { _json: data } unless data.is_a?(Hash)
  data.deep_transform_keys!(&:underscore)
}
