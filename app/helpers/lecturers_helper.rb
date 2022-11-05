module LecturersHelper
    
    def can_view_grades?(user)
        user.admin? || user.instructor?
    end
        
end
