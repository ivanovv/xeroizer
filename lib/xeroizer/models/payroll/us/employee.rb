module Xeroizer
  module Record
    module Payroll
      module US

        class EmployeeModel < PayrollUSBaseModel

          set_permissions :read, :write, :update

        end

        class Employee < PayrollUSBase

          set_primary_key :employee_id

          guid :employee_id
          string :status
          string :title
          string :first_name
          string :middle_names
          string :last_name
          date :start_date
          string :email
          date :date_of_birth
          string :gender
          string :phone
          string :mobile
          string :twitter_user_name
          boolean :is_authorised_to_approve_leave
          boolean :is_authorised_to_approve_timesheets
          string :occupation
          string :classification
          guid :ordinary_earnings_rate_id
          guid :payroll_calendar_id
          string :employee_group_name
          date :termination_date
          datetime_utc :updated_date_utc, :api_name => 'UpdatedDateUTC'

          belongs_to :home_address, :internal_name_singular => "home_address", :model_name => "HomeAddress"
          belongs_to :tax_declaration, :internal_name_singular => "tax_declaration", :model_name => "TaxDeclaration"
          has_many :bank_accounts
          belongs_to :pay_template, :internal_name_singular => "pay_template", :model_name => "PayTemplate"
          belongs_to :opening_balances, :internal_name_singular => "opening_balance", :model_name => "OpeningBalances"
          has_many :super_memberships


          has_many :salary_and_wages, :list_complete => true

        end

      end
    end
  end
end
