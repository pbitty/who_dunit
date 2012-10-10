require 'spec_helper'

class Core
	extend WhoDunit::Core
end

class User < SuperModel::Base
end

class Model < SuperModel::Base
	extend WhoDunit::ModelAdditions
	who_dunit
end

describe WhoDunit::ModelAdditions do

	before do
		@current_user = User.create!

		# Set user globally (in thread)
		Core.current_user = @current_user
	end

	describe "model" do

		before { @item = Model.create! }

		describe "on create" do
			it "should be created_by current_user" do
				@item.created_by.should eq(@current_user)
			end

			it "should be updated_by current_user" do
				@item.updated_by.should eq(@current_user)
			end
		end

		describe "on save" do
			before do
				@new_user = User.create!
				Core.current_user = @new_user	

				@item.save!
			end

			it "should be updated_by new_user" do
				@item.updated_by.should eq(@new_user)
			end

			it "should not be updated_by current_user" do
				@item.updated_by.should_not eq(@current_user)
			end
		end
	end
end