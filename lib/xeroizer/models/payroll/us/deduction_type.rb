module Xeroizer
  module Record
    module Payroll
      module US

        class DeductionTypeModel < PayrollUSBaseModel

        end

        class DeductionType < PayrollUSBase

          string :name
          string :account_code # http://developer.xero.com/api/Accounts
          boolean :reduces_super
          boolean :reduces_tax

          guid :deduction_type_id

          datetime_utc :updated_date_utc, :api_name => 'UpdatedDateUTC'

          validates_presence_of :name, :account_code, :reduces_tax, :reduces_super

        end

      end
    end
  end
end
