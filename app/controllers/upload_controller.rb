class UploadController < ApplicationController
 def index
	render :file => 'app/views/upload/uploadfile.rhtml'
  end
 
  def getFileName(filename) 
     if !filename.nil? 
        return filename
     end    
  end
 
  def uploadFile
    i = params[:upload].size
    for num in (0..i-1)
    	#post = DataFile.save(params[:upload][num])
      file = params[:upload][num]
     if !file.original_filename.empty?
      @filename=getFileName(file.original_filename)
      File.open("#{RAILS_ROOT}/public/data/#{@filename}", "wb") do |f|
      f.write(file.read)
      end
     end
    end
    render :text => "File has been uploaded successfully"
  end
end
