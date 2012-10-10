require 'spec_helper'

class Core
  extend WhoDunit::Core
end

class User
end

class TestController < ActionController::Base
  extend WhoDunit::ControllerAdditions
  who_dunit

  attr_reader :provided_user

  def test_action
    @provided_user = Core.current_user
  end

  def current_user
    @user ||= User.new
  end
end

describe WhoDunit::ControllerAdditions do

  Test::Application.routes.draw do
    get 'test_action' => "test#test_action"
  end

  it "should pass current user to WhoDunit::Core" do
    controller = TestController.new
    controller.test_action
    controller.provided_user.should(controller.current_user)
  end
end