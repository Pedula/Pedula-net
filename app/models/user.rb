class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	has_secure_password 

	validates_presence_of :email, :full_name, :location, :bio, :password_digest
	
	validates_length_of :bio, :minimum => 3, :allow_blank => false
	
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	
	validates_uniqueness_of :email

	  

	before_save { self.email = email.downcase }
	
	before_create :generate_token

	def generate_token
		self.confirmation_token = SecureRandom.urlsafe_base64
	end

	def confirm!
		return if confirmed?
		self.confirmed_at = Time.current
		self.confirmation_token = ''
		save!		
	end

	def confirmed?
		confirmed_at.present?
	end

end
