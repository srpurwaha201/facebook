class Post < ActiveRecord::Base
  belongs_to :user

  def timediff
    diff = (Time.now - self.updated_at).round()
    type = nil;
    if diff < 60
      type = "seconds"
    elsif diff < 3600
      diff = diff/60
      type = "minutes"
    elsif diff < 86400
      type = "hours"
      diff = diff/3600
    else
      type = "days"
      diff = diff/86400
    end
    time = {}
    time[:type] = type
    time[:diff] = diff
    return time
  end
end
