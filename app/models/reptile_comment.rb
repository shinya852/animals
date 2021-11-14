class ReptileComment < ApplicationRecord
  belongs_to :user
  belongs_to :reptile
end
