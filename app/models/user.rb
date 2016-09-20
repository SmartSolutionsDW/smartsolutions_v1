class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: [:user, :operator, :chef, :admin]

  after_initialize :set_default_role
  after_create :set_default_profile 

  def set_default_role

  self.role ||= :user
    
  end
  
  def default_profile

    #if self.profile.nil?

     profile = Profile.new

     profile.user = self

     profile.save

    # self.save      

  end

    #self.profile

  #end
  
  def friendly_name

    self.profile.first_name.nil? ? self.email : self.profile.full_name
   # if self.default_profile.first_name.nil?

     # self.email

   # else

     # self.profile.full_name

   # end

  end
end
