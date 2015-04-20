require 'roo'

class DynamicUrlsController < ApplicationController
 

  def add
      @dynamic_url = DynamicUrl.new({:url => "#{params[:url].strip}"}) 
      @dynamic_url.save!
      render json: DynamicUrl.all.to_json
  end

  def get_data
    render json: DynamicUrl.all.to_json
  end

  def delete
    @dynamic_url = DynamicUrl.find("#{params[:id]}")
    @dynamic_url.destroy
    render json: DynamicUrl.all.to_json
  end

  def import
    Rails.logger.info("inside")

    params.each do |h, q|
      Rails.logger.info "******************"
      Rails.logger.info "#{h} = #{q}"
    end

     
      ajax_upload = params[:name].is_a?(String)
      filename = ajax_upload  ? params[:name] : params[:name].original_filename
      extension = filename.split('.').last
      
      # Creating a temp file
      tmp_file = "#{Rails.root}/tmp/new_uploaded.#{extension}"
      

      #Save to temp file
      File.open(tmp_file, 'wb') do |f|
        if ajax_upload
          f.write  request.body.read
        else
          f.write params[:name].read
        end
      end

      #read file....
      @file = File.new(tmp_file)
      read_file(@file)


      render json: DynamicUrl.all.to_json
  end

  private

  def save_file_to_tmp(uploaded_file)
    FileUtils.mv(uploaded_file, @tmp_file )
    @tmp_file
  end

  def read_file(file)
    @spreadsheet = open_spreadsheet(file)
    @spreadsheet.default_sheet = @spreadsheet.sheets.first 
    # reference from http://hellarobots.com/2011/11/25/reading-data-from-a-spreadsheet-with-roo.html
    headers = Hash.new
        @spreadsheet.row(1).each_with_index {|header,i| headers[header] = i }
    
    ((@spreadsheet.first_row + 1)..@spreadsheet.last_row).each do |row|
       # Get the column data using the column heading.
        url = (@spreadsheet.row(row)[headers['urls']])
        p "As it is -----------------------------------"
        p url
        new_url = url.to_s.squish
        p "Removed spaces -----------------------------"
        p new_url
        @dynamic_url = DynamicUrl.new({:url => "#{new_url}"}) if !(new_url =~ /\A#{URI::regexp(['http', 'https'])}\z/).nil?
        @dynamic_url.save!
        print "Row:  #{url},\n\n"
    end
  end

  def open_spreadsheet(file)
    case File.extname(file.path)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type"
    end
  end

end
