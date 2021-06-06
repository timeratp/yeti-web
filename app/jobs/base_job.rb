# frozen_string_literal: true

require_relative Rails.root.join('lib/scheduler/job/base').to_s

class BaseJob < Scheduler::Job::Base
  self.logger = Rails.logger

  class << self
    def type
      name.demodulize
    end

    def scheduler_options
      {
        overlap: false,
        name: type,
        timeout: 1200
      }
    end
  end

  def call
    after_start
    execute
    before_finish
  end

  def execute
    raise NotImplementedError
  end

  def before_finish; end

  def after_start; end

  def capture_job_extra(extra)
    CaptureError.with_extra(type => extra) { yield }
  end
end
