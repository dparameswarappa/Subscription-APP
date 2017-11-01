class User < ActiveRecord::Base
    enum role: [:user, :admin, :basic, :classic, :modern]
    after_initialize :set_default_role, :if => :new_record?
    after_initialize :set_default_plan, :if => :new_record?
    # after_create :sign_up_for_mailing_list

    belongs_to :plan 
    validates_associated :plan

    def set_default_role
      self.role ||= :user
    end

    def set_default_plan
      self.plan ||= Plan.first
    end
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum:255 },
                      format: { with:VALID_EMAIL_REGEX},
                      uniqueness: { case_sensitive: false }
    has_secure_password
end
