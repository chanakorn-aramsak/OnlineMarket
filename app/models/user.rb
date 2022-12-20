class User < ApplicationRecord
    has_many :inventories
    has_many :markets
    
    has_secure_password
end
