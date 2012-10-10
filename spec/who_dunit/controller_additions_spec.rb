require 'spec_helper'

class Core
  extend WhoDunit::Core
end

class User
end

class TestController < ActionController::Base
  attr_reader :provided_user

  who_dunit

  def test_action
    @provided_user = Core.current_user
  end

  def current_user
    @user ||= User.new
  end
end

describe WhoDunit::ControllerAdditions do

  it "should pass current user to WhoDunit::Core" do
    action = TestController.action(:test_action)
    action.call({})

    action.provided_user.should(action.current_user)
  end

	pending "getting started with ControllerAdditions"
end