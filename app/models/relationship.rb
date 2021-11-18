class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'user'
  belongs_to :follower, class_name: 'user'
end
