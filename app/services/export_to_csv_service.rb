require "csv"
class ExportToCsvService
  def product_list
    Product.all
  end

  def content_csv
    CSV.generate do |csv|
      csv << Product::CSV_HEADERS
      product_list.each do |product|
        csv << Product::CSV_HEADERS.map{ |header| product.send(header) }
      end
    end
  end

  def export_to_csv
    File.open("#{Rails.root}/public/products.csv", "wb") do |f|
      f.write(content_csv)
    end
  end
end