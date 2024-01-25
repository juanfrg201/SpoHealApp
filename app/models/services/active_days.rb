module Services
  class ActiveDays
    attr_accessor :user_id

    def initialize(user_id)
      @user = User.find(user_id)
      @start_week, @end_week = start_end_week
      @today_day_number = (Date.today.wday + 6) % 7
      @week_active_days = @user.active_days.where(start_week: @start_week, end_week: @end_week)
    end

    def perform
      if @week_active_days.present?
        if ActiveDay.days[@week_active_days.last.day] == @today_day_number
          @week_active_days.sort_by { |day| ActiveDay.days[day.day] }
        else
          register_day
        end
      else 
        register_day
      end 
    end


    private 

    def start_end_week
      today = Date.today
  
      # Obtenemos el inicio de la semana (lunes)
      start_of_week = today - today.wday + 1
  
      # Obtenemos el final de la semana (domingo)
      end_of_week = start_of_week + 6
  
      return [start_of_week, end_of_week]
    end

    def register_day
      @user_regitser_day = @user.active_days.build(start_week: @start_week, end_week:  @end_week , day: @today_day_number)
      if @user_regitser_day.save 
        @user.active_days.where(start_week: @start_week, end_week: @end_week).sort_by { |day| ActiveDay.days[day.day] }
      else
        nil
      end
    end
  end
end