class User < ActiveRecord::Base
validates :mail,  :presence => true ,
		  :uniqueness => true
validates :nickname, :presence => true,
                    :length => { :maximum => 10 }
end
