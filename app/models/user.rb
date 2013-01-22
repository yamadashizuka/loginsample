class User < ActiveRecord::Base
  attr_accessible :mail, :name, :pass
end
