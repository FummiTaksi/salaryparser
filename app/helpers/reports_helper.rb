module ReportsHelper

  include DateHelper

  def fileIsInRightFormatForCalculation(file)
    workers = [];
    date = nil;
    CSV.foreach(file.path, headers: true) do |row|
      if (!checkIfRowsDataIsLegit(row))
        return false;
      end
      newDate = row["Date"].to_date;
      if (!date.nil? && !areDatesInSameMonth(date, newDate))
        return false;
      end
      date = newDate;
      worker = Worker.new(workerId: row["Person ID"], name: row["Person Name"]);
      if (thereIsWorkerWithSameIdButDifferentName(workers,worker))
        return false;
      end
      addWorkerToList(workers,worker);
    end
    return true;
  end

  def checkIfRowsDataIsLegit(row)
    begin
     date  = row["Date"].to_date;
    rescue => ex
      logger.error ex.message
      return false;
    end
      return nameIsNotEmpty(row["Person Name"]) && isNumber(row["Person ID"]) &&
             date.to_date.is_a?(Date) && isClockTime(row["Start"]) && isClockTime(row["End"]);
  end

  def nameIsNotEmpty(name)
    if name.nil?
      return false;
    end
    return name.length > 0;
  end

  def isNumber(param)
    /^[0-9]+$/.match(param)
  end

  def thereIsWorkerWithSameIdButDifferentName(workers,newWorker)
    workers.each do |worker|
      if (worker.sameIdAndDifferentName(newWorker))
        return true;
      end
    end
    return false;
  end

  def workerIsNotInTheList(workers, newWorker)
    workers.each do |worker|
      if (worker.equals(newWorker))
        return false;
      end
    end
    return true;
  end

  def addWorkerToList(workerList, worker)
    if (workerIsNotInTheList(workerList, worker))
      workerList.push(worker)
    end
  end
end
