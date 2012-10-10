require 'spec_helper'

class User
end

class AnotherUser
end

##
# Exposes the value passed in via the :user_class option
## 
class ClassNameExposer < SuperModel::Base
	extend WhoDunit::ModelAdditions
	
	@@user_class_name = nil

	def self.belongs_to(association, options)
		# The value of :class_name comes from :user_class passed into who_dunit method
		@@user_class_name = options[:class_name]
	end

	def self.user_class_name
		@@user_class_name
	end
end

describe WhoDunit do
	describe "options" do
		describe "setting class of associations based on :user_class" do

      it "should have default :user_class = User" do
				test_class = Class.new(ClassNameExposer) do
					who_dunit
				end

				test_class.user_class_name.should eq(User)
			end

			it "should allow overriding of :user_class" do
				test_class = Class.new(ClassNameExposer) do
					who_dunit user_class: AnotherUser
				end

				test_class.user_class_name.should_not eq(User)
				test_class.user_class_name.should eq(AnotherUser)
			end
		end
	end
end