class Surveyuser < ApplicationRecord
  belongs_to :users
  belongs_to :surveys
end
