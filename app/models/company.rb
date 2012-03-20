class Company < ActiveRecord::Base
has_many :employees
validates :name, :presence =>true
validates :address, :presence =>true
validates :name, :uniqueness => true
validates :phone, :uniqueness => true
validates :phone, :length => {:minimum => 10, :maximum => 25}, :format => { :with => /\A\S[0-9\+\/\(\)\s\-]*\z/i }, :allow_nil  => true



end
