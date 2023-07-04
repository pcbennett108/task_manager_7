class Task < ApplicationRecord
  def laundry?
    if title == "laundry" || description == "laundry"
      return true
    else
      return false
    end
  end
end