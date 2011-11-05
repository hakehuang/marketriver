class UploadController < ApplicationController
 def index
	render :file => 'app/views/upload/uploadfile.rhtml'
  end
 
  def getFileName(filename) 
     if !filename.nil? 
        return filename
     end    
  end
 
  def uploadFile()
    i = params[:upload].size
    for num in (0..i-1)
      file = params[:upload][num]
      if !file.original_filename.empty?
        @filename=getFileName(file.original_filename)
        @filename=current_user.id.to_s + "_" + Time.now.year.to_s + Time.now.month.to_s + Time.now.mday.to_s + rand(1000).to_s + '_' +  @filename
        File.open(Rails.root + "app/assets/images/#{@filename}", "wb") do |f|
        f.write(file.read)
      end
      DataFile.savefile(@filename,current_user.id, params[:product]["id"])
     end
    end
    #render :text => "File has been uploaded successfully"
    @product = Product.find(params[:product]["id"])
    redirect_to(@product) and return
  end
end
