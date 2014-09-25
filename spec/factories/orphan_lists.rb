FactoryGirl.define do
  factory :orphan_list do
    # Does the following line work correctly on Windows?
    spreadsheet { Rack::Test::UploadedFile.new 'spec/files/empty.xlsx', 'application/vnd.ms-excel' }
    orphan_count { (0..50).to_a.sample }
    association :partner, factory: :partner
  end
end

