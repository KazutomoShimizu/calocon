FactoryBot.define do
  factory :food do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'))}
    body { 'テスト' }
  end

  factory :second_food, class: Food do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'))}
    body { 'テスト2' }
  end
end
