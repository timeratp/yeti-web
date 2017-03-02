# == Schema Information
#
# Table name: reports.vendor_traffic_report_data
#
#  id                  :integer          not null, primary key
#  report_id           :integer          not null
#  customer_id         :integer
#  calls_count         :integer
#  calls_duration      :integer
#  acd                 :float
#  asr                 :float
#  origination_cost    :decimal(, )
#  termination_cost    :decimal(, )
#  profit              :decimal(, )
#  success_calls_count :integer
#  first_call_at       :datetime
#  last_call_at        :datetime
#  short_calls_count   :integer
#

class Report::VendorTrafficData < Cdr::Base
  self.table_name = 'reports.vendor_traffic_report_data'

  belongs_to :report, class_name: 'Report::VendorTraffic', foreign_key: :report_id
  belongs_to :customer, class_name: 'Contractor', foreign_key: :customer_id # ,:conditions => {:vendor => true}

  def display_name
    "#{self.id}"
  end

  def self.totals
    select("sum(calls_count)::int as calls_count,
                            sum(success_calls_count)::int as success_calls_count,
                            sum(short_calls_count)::int as short_calls_count,
                            sum(calls_duration) as calls_duration,
                            sum(origination_cost) as origination_cost,
                            sum(termination_cost) as termination_cost,
                            sum(profit) as profit,
                            min(first_call_at) as first_call_at,
                            max(last_call_at) as last_call_at"
    ).to_a.first
  end

end
