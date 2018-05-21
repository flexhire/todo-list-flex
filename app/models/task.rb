class Task < ApplicationRecord
  include SerializableResource

  enum priority: %i[high medium low]
  belongs_to :user
end
