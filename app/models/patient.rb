class Patient < ApplicationRecord
  def self.patients_by_age
    order(age: :desc)
  end
end
