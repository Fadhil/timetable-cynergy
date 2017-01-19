class Profile < ActiveRecord::Base
  def self.salutations
    ['Dato', 'Datin', 'Prof Dr',
     'Assoc. Prof Dr', 'Dr','Mr', 'Mrs', 'Miss']
  end
end
