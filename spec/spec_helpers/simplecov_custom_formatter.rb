require 'simplecov'

class SimpleCovCustomFormatter < SimpleCov::Formatter::SimpleFormatter
  def format(result)
    percentage = result.source_files.covered_percent.to_f.round(2)
    file = File.open('./.coverage.txt', 'w')
    file.write(percentage)
    file.close
    puts "Coverage is #{percentage}%"
  end
end