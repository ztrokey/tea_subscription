class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: { pending: 0, active: 1, canceled: 2 }
  enum frequency: { weekly: 0, monthly: 1, quarterly: 2 }
end
