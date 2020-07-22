class ReportController < ApplicationController
require 'csv'
require 'faraday'

    def csv
        file = "#{Rails.root}/public/produto.csv"
        table = Produto.all;0
        unless table.empty?
            CSV.open( file, 'w' ) do |writer|
                writer << table.first.attributes.map { |a,v| a }
                table.each do |s|
                    writer << s.attributes.map { |a,v| v }
                end
            end
        
        send_mail
        end
    end

    def send_mail
        conn = Faraday.new do |f|
            f.request :multipart
            f.request :url_encoded
            f.adapter :net_http
        end
        file_io = Faraday::UploadIO.new("#{Rails.root}/public/produto.csv", 'text/plain')
        conn.post('http://localhost:4000/email', file: file_io)
    end
end