FactoryBot.define do
  factory :connect do
    title { 'Google翻訳' }
    link { 'https://translate.google.co.jp/?hl=ja#view=home&op=translate&sl=en&tl=ja' }
    position { 1 }
    association :user
    association :box
  end
end
