module Xeroizer
  class PayrollUSApplication
    
    attr_reader :application

    extend Forwardable
    def_delegators :application, :client, :request_token, :access_token, :authorize_from_request,
                   :authorize_from_access, :logger, :xero_url, :logger=, :xero_url=, :client,
                   :rate_limit_sleep, :rate_limit_max_attempts, # all from generic_application.rb
                   :renew_access_token, :expires_at, :authorization_expires_at, :session_handle # partner_application.rb

    # Factory for new Payroll BaseModel instances with the class name `record_type`.
    # Only creates the instance if one doesn't already exist.
    #
    # @param [Symbol] record_type Symbol of the record type (e.g. :Invoice)
    # @return [BaseModel] instance of BaseModel subclass matching `record_type`
    def self.record(record_type)
      define_method record_type do
        var_name = "@#{record_type}_cache".to_sym
        unless instance_variable_defined?(var_name)
          instance_variable_set(var_name, Xeroizer::Record::Payroll::US.const_get("#{record_type}Model".to_sym).new(self.application, record_type.to_s))
        end
        instance_variable_get(var_name)
      end  
    end

    record :Employee
    record :Timesheet
    record :PayItem
    record :PaySchedule
    record :LeaveApplication
    record :PayRun
    record :Payslip
    record :Setting
    record :WorkLocation

    def initialize(application)
      @application = application
    end

  end
end
