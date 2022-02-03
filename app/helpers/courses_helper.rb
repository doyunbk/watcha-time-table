module CoursesHelper

    def hours_range(course)
        start_time = course.start_time.strftime("%H").to_i  
        end_time = course.end_time.strftime("%H").to_i  

        time_difference = end_time - start_time

        course_code = course.code

        case time_difference
        when 2
            if start_time == 9
                    "<li class='lecture-time two-hr hr-9' data-event='lecture-01'>".html_safe
            elsif start_time == 10
                    "<li class='lecture-time two-hr hr-10' data-event='lecture-02'>".html_safe
            elsif start_time == 11
                    "<li class='lecture-time two-hr hr-11' data-event='lecture-03'>".html_safe
            elsif start_time == 12
                    "<li class='lecture-time two-hr hr-12' data-event='lecture-04'>".html_safe
            elsif start_time == 13
                    "<li class='lecture-time two-hr hr-13' data-event='lecture-05'>".html_safe
            elsif start_time == 14
                    "<li class='lecture-time two-hr hr-14' data-event='lecture-06'>".html_safe
            elsif start_time == 15
                    "<li class='lecture-time two-hr hr-15' data-event='lecture-07'>".html_safe
            elsif start_time == 16
                    "<li class='lecture-time two-hr hr-16' data-event='lecture-08'>".html_safe
            elsif start_time == 17
                    "<li class='lecture-time two-hr hr-17' data-event='lecture-09'>".html_safe
            end
        when 1
            if start_time == 9
                    "<li class='lecture-time hr-9' data-event='lecture-01'>".html_safe
            elsif start_time == 10
                    "<li class='lecture-time hr-10' data-event='lecture-02'>".html_safe
            elsif start_time == 11
                    "<li class='lecture-time hr-11' data-event='lecture-03'>".html_safe
            elsif start_time == 12
                    "<li class='lecture-time hr-12' data-event='lecture-04'>".html_safe
            elsif start_time == 13
                    "<li class='lecture-time hr-13' data-event='lecture-05'>".html_safe
            elsif start_time == 14
                    "<li class='lecture-time hr-14' data-event='lecture-06'>".html_safe
            elsif start_time == 15
                    "<li class='lecture-time hr-15' data-event='lecture-07'>".html_safe
            elsif start_time == 16
                    "<li class='lecture-time hr-16' data-event='lecture-08'>".html_safe
            elsif start_time == 17
                    "<li class='lecture-time hr-17' data-event='lecture-09'>".html_safe
            end
        end
    end


end
