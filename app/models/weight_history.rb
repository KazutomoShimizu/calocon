class WeightHistory < ApplicationRecord
  validates :weight, numericality: {greater_than: 20,less_than: 200}
  validate :day_after_today
  belongs_to :user

  private
  def day_after_today
    unless start_time == nil
      errors.add(:start_time, 'は、未来の日付で保存できません') if start_time > Date.tomorrow
    end
  end
end
