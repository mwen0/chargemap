class Country < ApplicationRecord
  mount_uploader :flag_image, FlagImageUploader

  # Direct associations

  has_many   :addresses,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
