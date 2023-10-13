#!/usr/bin/env ruby

require 'active_support/core_ext/hash/deep_merge'
require 'fileutils'
require 'yaml'

PATH = './doc/openapi.yaml'.freeze

file = YAML.safe_load(File.read(PATH))
Dir.glob('./doc/openapi?.yaml').each do |filename|
  file.deep_merge!(YAML.safe_load(File.read(filename)))
end
# Sort endpoints alphabetically
file['paths'] = file['paths'].sort.to_h
File.write(PATH, YAML.dump(file))
FileUtils.cp(PATH, "./tmp/openapi.#{ENV['KNAPSACK_CI_NODE_INDEX']}.yaml")
