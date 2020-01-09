# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students 

  def self.search(search) 
    
      if search.empty?
      @students = self.all 
      elsif 
      @students = self.where('name LIKE ?', '%' + search + '%' ) 
    
        if @students.empty? 
           @students = self.all 
        end 
    
    end 
    @students
  end
end
