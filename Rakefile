require 'rspec/core/rake_task'
 
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./specs/**/*_spec.rb" # don't need this, it's default.
  t.rspec_opts = "--format html -o \'result.html\' "
  # Put spec opts in a file named .rspec in root
end
