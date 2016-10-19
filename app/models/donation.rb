class Donation < ActiveRecord::Base
  belongs_to :donor

  def hasparts_yn
    parts ? 'Yes' : 'No'
  end

end
