class Api::Rest::Admin::FilterTypeResource < JSONAPI::Resource
  immutable
  attributes :name
  filter :name
end
