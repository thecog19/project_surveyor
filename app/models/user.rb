class User < ApplicationRecord
  has_many :surveyuser
  has_many :surveys, :through => :surveyuser
end
