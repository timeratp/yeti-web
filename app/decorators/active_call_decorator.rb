# frozen_string_literal: true

class ActiveCallDecorator < ApplicationDecorator
  def self.object_class_namespace
    'RealtimeData'
  end

  RealtimeData::ActiveCall.association_types.each do |name, options|
    define_method("#{name}_link") do
      record = model.public_send(name)
      record ? h.auto_link(record) : model.public_send(options[:foreign_key])
    end
  end
end
