class Survey < ApplicationRecord
  validates :name, presence: true
  has_many :questions, dependent: :destroy # polymorphic child type?
  has_many :responses, class_name: "SurveyResponse"
  before_create :format_title

  def no_questions?
    questions.empty?
  end

  private
    def format_title
      self.name = name.titleize
    end
end
