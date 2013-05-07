require 'testraf/report'
require "open4"

class Command
  def initialize(command)
    @command = command
  end

  def run(input)
    #output = `echo '#{input}' | /usr/bin/time -f '%e' #{@command}`
    pid, stdin, stdout, stderr = Open4::popen4 "echo '#{input}' | /usr/bin/time -f '%e' #{@command}" 
    ignored, status = Process::waitpid2 pid

    Report.new(stdout.read, stderr.read, status.exitstatus)
  end
end