json.extract! course, :id, :code, :title, :description, :professor, :location, :capacity, :start_time, :end_time, :dayofweek, :created_at, :updated_at
json.url course_url(course, format: :json)
