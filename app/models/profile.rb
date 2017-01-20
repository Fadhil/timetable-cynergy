class Profile < ActiveRecord::Base
  belongs_to :faculty

  def self.salutations
    ['Dato', 'Datin', 'Prof Dr',
     'Assoc. Prof Dr', 'Dr','Mr', 'Mrs', 'Miss']
  end
end
