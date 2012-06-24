class DataFile < ActiveRecord::Base

 belongs_to :product

 def self.savefile(filename,user_id, product_id)
    # update to data base
   @datafile = DataFile.new
   @datafile.path=filename
   @datafile.user_id=user_id
   @datafile.product_id=product_id
   @datafile.save  
 end
end
