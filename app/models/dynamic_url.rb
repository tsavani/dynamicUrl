

class DynamicUrl < ActiveRecord::Base
	validates :url, presence: true
    
   

	def self.import(file)
      # p "@@@@@@@@@@"
      # p "inside model"
      # p "@@@@@@@@@@"
      # # s = Roo::Excelx.new(file)
      # workbook = Excelx.new(file)
      # workbook.default_sheet = workbook.sheets[0]
      # p "------------" 
      # p workbook.default_sheet
      # p "------------"
	  # spreadsheet = open_spreadsheet(file)
	  # header = spreadsheet.row(1)
	  # (2..spreadsheet.last_row).each do |i|
	  #   row = Hash[[header, spreadsheet.row(i)].transpose]
	  #   product = find_by_id(row["id"]) || new
	  #   product.attributes = row.to_hash.slice(*accessible_attributes)
	  #   product.save!
	  # end
	end

	def self.open_spreadsheet(file)
	  # case File.extname(file.original_filename)
	  # when ".csv" then Csv.new(file.path, nil, :ignore)
	  # when ".xls" then Excel.new(file.path, nil, :ignore)
	  # when ".xlsx" then Excelx.new(file.path, nil, :ignore)
	  # else raise "Unknown file type: #{file.original_filename}"
	  # end
	end


end
