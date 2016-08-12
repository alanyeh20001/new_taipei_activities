$: << "lib"

require "optparse"

require "activity"

# Get output file of activities from command line.
options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: script/update.rb [options] [FileName]"

  opts.on('-o File', '--output File', 'The output file of activities') do |file|
    options[:output] = file
  end
end.parse!

# Get activities from API & store them in output file.
store_path = options[:output]

activity_path = "http://data.ntpc.gov.tw/od/data/api/029E3FC2-1927-4534-8702-DA7323BE969B?$format=json"

activities = Activity.new(activity_path: activity_path,
                          activity_store_path: store_path)


