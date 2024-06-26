# frozen_string_literal: true

class RealtimeData::SipOptionsProber < YetiResource
  include ActiveModel::Validations
  include WithQueryBuilder

  class << self
    def query_builder_find(id, **_)
      node_id, id = id.split('*')
      node = Node.find(node_id)
      result = node.api.sip_options_probers([id])
      raise ActiveRecord::RecordNotFound if result.empty?

      item = result.first.merge(node: node)
      RealtimeData::SipOptionsProber.new(item)
    end

    def query_builder_collection(**_)
      result = NodeParallelRpc.call(default: [], default_on_error: true) do |node|
        result = node.api.sip_options_probers
        result.map { |row| row.merge(node: node) }
      end
      result.map { |item| RealtimeData::SipOptionsProber.new(item) }
    end
  end

  attribute :append_headers, :string
  attribute :contact, :string
  attribute :from, :string
  attribute :id, :integer
  attribute :interval, :integer
  attribute :last_reply_code, :integer
  attribute :last_reply_contact, :string
  attribute :last_reply_delay_ms, :integer
  attribute :last_reply_reason, :string
  attribute :local_tag, :string
  attribute :name, :string
  attribute :proxy, :string
  attribute :ruri, :string
  attribute :sip_interface_name, :string
  attribute :to, :string

  has_one :node, class_name: 'Node', foreign_key: :node_id
end
