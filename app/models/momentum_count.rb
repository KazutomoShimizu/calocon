class MomentumCount < ApplicationRecord
  def index
    @works = Work.all
  end
end
