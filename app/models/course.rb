class Course < ApplicationRecord

    validates :code, presence: true, uniqueness: { case_sensitive: false }
    validates :title, presence: true, length: { minimum: 2, maximum: 50 }
    validates :professor, presence: true, length: { minimum: 2, maximum: 10 }
    validates :location, presence: true, length: { minimum: 2, maximum: 10 }
    validates :start_time, presence: true
    validates :end_time, presence: true

    serialize :dayofweek, Array
    has_many :enrollments, dependent: :destroy

end
