class Report
  def initialize(standard_out, standard_err, exit_status) 
    @standard_out = standard_out
    @standard_err = standard_err
    @exit_status = exit_status.to_i
  end

  def run_time
    @run_time ||= @standard_err.to_f
  end

  def output
    @standard_out
  end

  def exit_status
    @exit_status
  end
end