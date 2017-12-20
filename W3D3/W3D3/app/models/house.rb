class House < ApplicationRecord
  alias_attribute :people, :residents
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
end
