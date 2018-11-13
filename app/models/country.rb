class Country < ApplicationRecord
  # Direct associations

  has_many   :addresses,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
