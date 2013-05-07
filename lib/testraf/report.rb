class Report
  def initialize(standard_out, standard_err, exit_status) 
    @run_time = standard_err.to_f
    @output = standard_out
    @exit_status = exit_status
  end

  def run_time
    @run_time
  end

  def output
    @output
  end

  def exit_status
    @exit_status
  end
end