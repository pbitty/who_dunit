require 'spec_helper'

class User < SuperModel::Base
end

class Item < SuperModel::Base
	extend WhoDunit::ModelAdditions
	whodunit user_class: User
end


describe WhoDunit do

	describe "model callbacks" do

		before do
			@current_user = User.new
		
			module WhoDunit
				class << self
					private
					def current_user
						@current_user
					end
				end
			end

			@item = Item.create!
		end

		it "should be created_by current_user" do
			@item.created_by.should eq(@current_user)
		end

		it "should be updated_by current_user" do
			@item.updated_by.should eq(@current_user)
		end
	end
end