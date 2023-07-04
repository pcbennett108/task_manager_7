require "rails_helper"

RSpec.describe Task, type: :model do
  describe "instance methods" do
    describe "#laundry?" do
      # Build a method to determine if a task has laundry in the title
      it "should return true if task title is laundry" do
        # create test Task object with NAMED PARAMETERS
        task = Task.create!(title: "laundry", description: "clean clothes")
        # NEW vs CREATE both creates the task but create puts it straight into the DB. Same as NEW + SAVE.
        # the ! is a loud failure (lets nothing slide and throws error page) vs a quiet failure
        # validate that running #laundry? -> true
        expect(task.laundry?).to be true
      end

      it "returns true when the description is laundry" do
        task = Task.create!(title: "Clean my clothes", description: "laundry")
    
        expect(task.laundry?).to be(true)
      end

      it "returns false when neither is laundry" do
        task = Task.create!(title: "run", description: "run far")
    
        expect(task.laundry?).to be(false)
      end

      it "returns true when title contains laundry" do
        task = Task.create!(title: "laundry day", description: "wash day tomorrow")
    
        expect(task.laundry?).to be(true)
      end

      it "returns true when description contains laundry" do
        task = Task.create!(title: "washing", description: "time to do some laundry")
    
        expect(task.laundry?).to be(true)
      end

      it "returns true when title contains mixed case laundry" do
        task = Task.create!(title: "lAundRy day", description: "wash day tomorrow")
    
        expect(task.laundry?).to be(true)
      end

      it "returns true when description contains mixed case laundry" do
        task = Task.create!(title: "washing", description: "time to do some lauNdry")
    
        expect(task.laundry?).to be(true)
      end
    end
  end
end