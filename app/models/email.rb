class Email < ApplicationRecord
  validates :html, presence: true
end
