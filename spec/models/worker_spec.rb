require 'rails_helper'

RSpec.describe Worker, type: :model do

  describe "equals " do

    describe "returns true when " do

      it "two elements have same workerId and name " do
          worker = createWorker(1, "worker")
          workerAgain = createWorker(1,"worker");
          expect(worker.equals(workerAgain)).to be_truthy
      end

    end

    describe "returns false when " do

        it "parameter is nil" do
          worker = createWorker(1, "worker");
          expect(worker.equals(nil)).to be_falsey
        end

        it "has same workerId but different name " do
          worker = createWorker(1, "worker");
          differentName = createWorker(1,"worker2");
          expect(worker.equals(differentName)).to be_falsey
        end

        it "has different workerId but same name " do
            worker = createWorker(1, "worker");
            worker2 = createWorker(2, "worker");
            expect(worker.equals(worker2)).to be_falsey;
        end

    end
  end

  describe "sameIdAndDifferentName " do

    describe "returns true when " do

      it "id is same and name different" do
        jukka = createWorker(1, "jukka");
        pekka = createWorker(1, "pekka");
        expect(jukka.sameIdAndDifferentName(pekka)).to be_truthy
      end

    end



    describe "returns false when " do

      it "id is same and name is same " do
        jukka = createWorker(1, "jukka");
        jukka2 = createWorker(1, "jukka");
        expect(jukka.sameIdAndDifferentName(jukka2)).to be_falsey
      end

      it "id is different and name is different " do
        jukka = createWorker(1, "jukka");
        jukkis = createWorker(2, "jukkis");
        expect(jukka.sameIdAndDifferentName(jukkis)).to be_falsey
      end

    end
  end

  def createWorker(workerId, name)
      return Worker.new workerId: workerId, name: name;
  end
end
