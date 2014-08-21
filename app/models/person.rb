class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :company_name, :email
  
  has_many :notes

  def self.merge(person_1, person_2)
    if person_1.email.include?("winner")
      person_1.notes << person_2.notes
      Person.find(person_2.id).delete
      return person_1
    else
      person_2.notes << person_1.notes
      Person.find(person_2.id).delete
      return person_2
    end
  end

  def duplicates?(person)
    unless person == nil
      if self[:first_name] == person[:first_name] && 
         self[:last_name] == person[:last_name] && 
         self[:email] == person[:email]
         return true
      end
    end
  end
end