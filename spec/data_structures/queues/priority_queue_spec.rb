require_relative "../../../src/data_structures/queues/priority_queue"

describe Algorithms::PriorityQueue do
  subject { described_class.new }

  context "queue one" do
    let(:arr) { [["a", 8], ["b", 2], ["c", 1], ["d", 4], ["e", 9], ["f", 7], ["g", 3]] }

    before(:each) do
      arr.each { |e| subject.push(e.first, priority: e.last) }
    end

    describe "#pop" do
      it "deletes properly from the queue" do
        sorted_by_priority = arr.sort_by { |e| e.last }

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
