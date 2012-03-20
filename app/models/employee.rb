class Employee < ActiveRecord::Base
 belongs_to :company
validates :first_name, :presence =>true
validates :last_name, :presence =>true
validates :phone_no, :presence =>true
#validates :email, :presence =>true
validates :phone_no, :uniqueness => true
validates :email, :uniqueness => true
attr_accessible :first_name, :last_name, :email, :phone_no


validates :email, :presence => true, 
                    :length => {:minimum => 10, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  


def self.search(search)
    if search
      where('first_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
