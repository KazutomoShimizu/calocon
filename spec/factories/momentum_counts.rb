FactoryBot.define do
  factory :momentum_count do
    work { 'ほぼ運動しない' }
    magnification { "1.2" }
  end

  factory :second_momentum_count, class: MomentumCount do
    work { '軽い運動' }
    magnification { "1.375" }
  end

  factory :third_momentum_count, class: MomentumCount do
    work { '中程度の運動' }
    magnification { "1.55" }
  end

  factory :fourth_momentum_count, class: MomentumCount do
    work { '激しい運動' }
    magnification { "1.725" }
  end

  factory :fifth_momentum_count, class: MomentumCount do
    work { '非常に激しい運動' }
    magnification { "1.9" }
  end
end
