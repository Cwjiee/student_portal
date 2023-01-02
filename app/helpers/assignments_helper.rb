module AssignmentsHelper
    def submitted?(submission)
      !submission.nil?
    end

    def date_format(date)
      date.strftime('%d-%b-%Y')
    end
end
