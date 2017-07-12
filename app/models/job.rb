class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true, numericality: {greater_than: :wage_lower_bound,message: "薪水下限不能高于薪水上限"}
  validates :wage_lower_bound, presence:true, numericality: {greater_than: 0}

  def publish!
    self.is_hidden = false
    self.save
  end
  def hide!
    self.is_hidden = true
    self.save
  end

   scope :published, -> {where(:is_hidden => false)}
   scope :recent, -> {order("created_at DESC")}
end
