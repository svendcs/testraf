require 'testraf/report'
require "open4"

class Command
  def initialize(command)
    @command = command
  end

  def run_command(command)
    pid, stdin, stdout, stderr = Open4::popen4 command
    ignored, status = Process::waitpid2 pid

    Report.new(stdout.read, stderr.read, status.exitstatus)
  end

  def run(input)
    run_command "echo '#{input}' | /usr/bin/time -f '%e' #{@command}" 
  end
end