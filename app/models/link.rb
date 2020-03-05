# class Link < ApplicationRecord
# end

class Link < ApplicationRecord
  belongs_to :user
end
