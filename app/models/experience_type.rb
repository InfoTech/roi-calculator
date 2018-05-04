class ExperienceType < ActiveRecord::Base
    has_many :measured_value_aggregations
end