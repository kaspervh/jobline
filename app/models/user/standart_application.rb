class User::StandartApplication < ApplicationRecord
  belongs_to :user
  has_rich_text :content
end
