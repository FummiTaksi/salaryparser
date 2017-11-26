module ReportsHelper

  include DateHelper, TimeHelper

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

  def calculateMonthlyWages(file)
    workers = [];
    CSV.foreach(file.path, headers: true) do |row|
      if (!checkIfRowsDataIsLegit(row))
        return false;
      end
      workshift = convertDataToWorkShift(row["Date"].to_date, row["Start"], row["End"]);
      worker = getWorkerById(workers, row["Person ID"].to_f);
      if (worker.nil?)
        newWorker = Worker.new(workerId: row["Person ID"], name: row["Person Name"], wage: workshift.calculateWage);
        workers.push(newWorker);
      else
        workers = addWageToWorker(workers,worker.workerId, workshift.calculateWage);
      end
    end
    workers.sort_by {|a| a.wage}
    return workers;
  end

  def convertDataToWorkShift(date,startTime,endTime)
    startArray = startTime.split(":");
    endArray = endTime.split(":");
    return generateWorkShift(date, startArray[0].to_f, startArray[1].to_f, endArray[0].to_f, endArray[1].to_f)
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

  def getWorkerById(workers, id)
    workers.each do |worker|
      if (worker.workerId == id)
        return worker;
      end
    end
    return nil;
  end

  def addWageToWorker(workers,id,amount)
    workers.each do |worker|
      if (worker.workerId == id)
        worker.addWage(amount)
      end
    end
    return workers;
  end
end
