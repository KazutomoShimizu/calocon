class MomentumCount < ApplicationRecord
  belongs_to :weight_history

  enum magnification: {ほぼ運動しない:1.2, 軽い運動:1.375, 中程度の運動:1.55, 激しい運動:1.725, 非常に激しい運動:1.9}
end
