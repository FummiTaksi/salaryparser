class Worker < ActiveRecord::Base



  def equals(worker)
    if (worker.nil?)
      return false;
    end
    return workerId == worker.workerId && name == worker.name;
  end

  def sameIdAndDifferentName(worker)
      if (worker.nil?)
        return false;
      end
    return workerId == worker.workerId && name != worker.name;
  end

end
