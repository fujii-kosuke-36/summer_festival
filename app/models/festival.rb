class Festival < ApplicationRecord
  belongs_to :user
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "location", "name", "updated_at"]
      end
end
