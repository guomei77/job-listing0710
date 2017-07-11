class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true, numericality: {greater_than: :wage_lower_bound,message: "薪水下限不能高于薪水上限"}
  validates :wage_lower_bound, presence:true, numericality: {greater_than: 0}


end
