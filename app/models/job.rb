class Job < ActiveRecord::Base

enum category: [:Full_time, :Part_time, :Freelance, :Contract]
end
