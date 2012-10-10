module WhoDunit
  module ControllerAdditions
    class Callbacks
      extend WhoDunit::Core

      def filter(controller)
        begin
          current_user = controller.current_user
          yield
        ensure
          clear_current_user
        end
      end
    end

    def who_dunit(options = {})
      around_filter WhoDunit::ControllerAdditions::Callbacks
    end
  end
end