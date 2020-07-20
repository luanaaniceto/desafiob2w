require 'rails_helper'

RSpec.describe ReportController, type: :controller do
  context 'validations' do
    it "ensures the csv produto" do
        report = File.file?("#{Rails.root}/public/produto.csv")
        expect(report).to eq(true)
    end   
  end
end
