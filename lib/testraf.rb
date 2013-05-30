require 'testraf/command'
require 'testraf/test'
require 'colorize'

class Testraf
  def initialize()

  end

  def pwd
    @pwd ||= `pwd`.strip
  end

  def list_files(reg_exp)
    Dir.entries(pwd).select do |path| 
      path.match(reg_exp)
    end
  end

  def sort_files(files)
    files.sort do |x, y|
      file_id(x) <=> file_id(y)
    end
  end

  def input_files
    files ||= sort_files list_files(/\d+\.in$/)
  end

  def output_file(input_file)
    file_name = input_file.gsub '.in', '.out'

    if File.exists?(file_name)
      file_name
    else
      nil
    end
  end

  def file_id(path)
    path.match(/(\d+)\.in/)[1].to_i
  end

  def run(command, options)
    command = Command.new(command)
    #puts command.run("hej")

    input_files.each do |input_file|
      if output_file(input_file) == nil
        puts "---> Test #{file_id input_file}".red
        puts "Missing expected output data".yellow
        next
      end

      input = File.read(input_file)
      expected = File.read(output_file input_file)
      report = command.run input

      test = Test.new input, expected
      if(report.exit_status.to_i != 0)
        puts "---> Test #{file_id input_file} (#{report.run_time}s)".red
        puts "Program exited with status #{report.exit_status}".yellow
        break unless options[:continue]
      elsif(test.compare_output report.output)
        puts "---> Test #{file_id input_file} (#{report.run_time}s)".green
      else
        puts "---> Test #{file_id input_file} (#{report.run_time}s)".red
        puts "Input".yellow
        puts input.strip[0..50], "\n"
        puts "Expected".yellow
        puts expected.strip[0..50], "\n"
        puts "Output".yellow
        puts report.output[0..50]
        break unless options[:c]
      end
    end
  end
end