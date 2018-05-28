require_relative "../../../src/data_structures/queues/priority_queue"

describe Algorithms::PriorityQueue do
  subject { described_class.new }

  context "empty queue" do
    describe "#push" do
      it "pushes an element onto the queue" do
        subject.push("a", priority: 1)
      end
    end

    describe "#empty?" do
      it "returns `true` if the queue is empty" do
        expect(subject.empty?).to be(true)
      end

      it "returns `false` if the queue is not empty" do
        subject.push("a", priority: 1)
        expect(subject.empty?).to be(false)
      end
    end
  end

  context "queue one" do
    let(:arr) { [["a", 8], ["b", 2], ["c", 1], ["d", 4], ["e", 9], ["f", 7], ["g", 3]] }

    before(:each) do
      arr.each { |e| subject.push(e.first, priority: e.last) }
    end

    describe "#pop" do
      it "deletes properly from the queue" do
        sorted_by_priority = arr.sort_by(&:last)

        sorted_by_priority.each do |lowest_tuple|
          expect(subject.min).to be(lowest_tuple.first)
          expect(subject.pop).to be(lowest_tuple.first)
        end
      end
    end

    describe "#min" do
      it "returns the min value in the queue" do
        expect(subject.min).to eq("c")
      end
    end

    describe "#size" do
      it "returns the proper size of the queue" do
        expect(subject.size).to be(arr.size)
      end
    end
  end

  context "queue two" do
    let(:arr) { [["a", 1], ["b", 2], ["c", 3], ["d", 4], ["e", 5]] }

    before(:each) do
      arr.each { |e| subject.push(e.first, priority: e.last) }
    end

    describe "#pop" do
      it "deletes properly from the queue" do
        sorted_by_priority = arr.sort_by(&:last)

        sorted_by_priority.each do |lowest_tuple|
          expect(subject.min).to be(lowest_tuple.first)
          expect(subject.pop).to be(lowest_tuple.first)
        end
      end
    end

    describe "#min" do
      it "returns the min value in the queue" do
        expect(subject.min).to eq("a")
      end
    end

    describe "#size" do
      it "returns the proper size of the queue" do
        expect(subject.size).to be(arr.size)
      end
    end
  end

  context "queue three" do
    let(:arr) { [["a", 5], ["b", 4], ["c", 3], ["d", 2], ["e", 1]] }

    before(:each) do
      arr.each { |e| subject.push(e.first, priority: e.last) }
    end

    describe "#pop" do
      it "deletes properly from the queue" do
        sorted_by_priority = arr.sort_by(&:last)

        sorted_by_priority.each do |lowest_tuple|
          expect(subject.min).to be(lowest_tuple.first)
          expect(subject.pop).to be(lowest_tuple.first)
        end
      end
    end

    describe "#min" do
      it "returns the min value in the queue" do
        expect(subject.min).to eq("e")
      end
    end

    describe "#size" do
      it "returns the proper size of the queue" do
        expect(subject.size).to be(arr.size)
      end
    end
  end

  context "queue four" do
    let(:arr) { [["a", 1], ["b", 1], ["c", 1], ["d", 1], ["e", 1]] }

    before(:each) do
      arr.each { |e| subject.push(e.first, priority: e.last) }
    end

    describe "#pop" do
      it "deletes properly from the queue" do
        sorted_by_priority = arr.sort_by(&:last)

        sorted_by_priority.each do |lowest_tuple|
          expect(subject.min).to be(lowest_tuple.first)
          expect(subject.pop).to be(lowest_tuple.first)
        end
      end
    end

    describe "#min" do
      it "returns the min value in the queue" do
        expect(subject.min).to eq("a")
      end
    end

    describe "#size" do
      it "returns the proper size of the queue" do
        expect(subject.size).to be(arr.size)
      end
    end
  end
end
