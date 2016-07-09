require "open-uri"
require "json"
require "yaml"
require "pry"

class Activity
  attr_accessor :activity_sort, :store_path
  
  def initialize(activity_path, store_path)
    @store_path = store_path
    activities_info = JSON.parse(open(activity_path).read)
    sorted_activities = quicksort(*activities_info)
    categorize(sorted_activities)
  end
  
  def quicksort(*activities)
    return [] if activities.empty?

    pivot = activities.delete_at(rand(activities.size))
    left, right = activities.partition { |activity| activity["activedate"] < pivot["activedate"] }

    return *quicksort(*left), pivot, *quicksort(*right)
  end
  
  def categorize(activities)
    @activity_sort = Hash.new{ |hash, key| hash[key] = [] }
    
    activities.each do |activity|
      case activity["classname"]
      when "藝文休閒"
        @activity_sort["leisure"] << activity
      when "青年體育"
        @activity_sort["sport"] << activity
      when "衛生保健"
        @activity_sort["hygiene"] << activity
      when "環境保護"
        @activity_sort["environment"] << activity
      when "社會福利"
        @activity_sort["welfare"] << activity
      when "教育"
        @activity_sort["education"] << activity
      when "交通觀光"
        @activity_sort["tourism"] << activity
      else "其他"
        @activity_sort["others"] << activity
      end
    end
    
    self.save
  end
  
  def save
    system("touch", store_path) unless File.exist?(store_path)
    
    File.open(store_path, 'w') do |file|
      file.write activity_sort.to_yaml
    end
  end
end

