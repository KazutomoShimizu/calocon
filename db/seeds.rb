MomentumCount.create!(
  work: "ほぼ運動しない",
  magnification: '1.2'
  )

MomentumCount.create!(
  work: "軽い運動",
  magnification: '1.375'
  )

MomentumCount.create!(
  work: "中程度の運動",
  magnification: '1.55'
  )

MomentumCount.create!(
  work: "激しい運動",
  magnification: '1.725'
  )

MomentumCount.create!(
  work: "非常に激しい運動",
  magnification: '1.9'
  )


  User.create!(
    name: "Admin",
    email: "admin@admin.com",
    password: "111111",
    admin: true)

  5.times do |i|
    User.create!(
      name: "user#{i + 1}",
      email: "user#{i + 1}@user.com",
      password: "111111",
      admin: false
    )
  end

  5.times do |i|
    start_time = DateTime.new(2022,6,rand(1..30))
    WeightHistory.create!(
      weight: "6#{i + 1}",
      start_time: start_time,
      user_id: 1
    )
  end


  5.times do |i|
    Food.create!(
      image: File.open("./app/assets/images/def.png"),
      body: "sample#{i + 1}",
      user_id: 1
    )
  end
