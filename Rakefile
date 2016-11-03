require 'rake'
require 'rake/testtask'

require_relative './app'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
end

task default: :test
