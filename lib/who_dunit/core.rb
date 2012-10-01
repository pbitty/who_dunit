require_relative "model_additions"
require_relative "controller_additions"

module WhoDunit
		class << self
		@@var_name = "#{self}_#{object_id}".to_sym

		private

		def current_user
			return Thread.current[@@var_name] if Thread.key? @@var_name
			raise "current_user not set in this thread"
		end

		def current_user=(user)
			raise "user must not be nil" if user.nil?
			Thread.current[@@var_name] = user
		end
	end
end