module Admin::ReportsHelper
    def report_check_unread(report)
    if report.waiting?
      "text-danger"
    elsif report.keep?
      "text-dark"
    else
      "text-black-50"
    end
  end
end
