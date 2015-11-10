require 'spec_helper'

describe TodoList do
  it { should have_many(:todo_items) }

  describe "#has_complete_items?" do
  	let(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery List") }

  	it "returns true with completed todo list items" do
  		todo_list.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
  		expect(todo_list.has_completed_items?).to be true 
  	end

  	it "returns false with no completed todo list items" do
  		todo_list.todo_items.create(content: "Eggs")
  		expect(todo_list.has_completed_items?).to be false
  	end
  end
  describe "#has_complete_items?" do
  	let(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery List") }

  	it "returns true with incompleted todo list items" do
  		todo_list.todo_items.create(content: "Eggs")
  		expect(todo_list.has_incompleted_items?).to be true
  	end

  	it "returns false with no incomplete todo list items" do
  		todo_list.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
  		expect(todo_list.has_incompleted_items?).to be false
  	end
  end
end
