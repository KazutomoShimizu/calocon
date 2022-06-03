class MomentumCountsController < ApplicationController
  def index
    @momentum_counts = MomentumCount.all
  end
end
