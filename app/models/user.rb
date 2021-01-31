class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #field :authentication_token

         validate :check_group_name_uniqueness

         def check_group_name_uniqueness
           if User.where("name like ?", name + "%").count > 0
             errors.add(:name, "is already taken")
           end
         end
end
