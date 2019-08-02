class AppliedJob < ApplicationRecord
	has_rich_text :application

	belongs_to :user
	belongs_to :application_status
	belongs_to :application_type
end
