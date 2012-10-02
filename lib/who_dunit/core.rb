module WhoDunit
	module Core
		@@var_name = "#{self}_#{object_id}".to_sym

		def current_user
			return Thread.current[@@var_name] if Thread.current.key? @@var_name
			raise "current_user not set in this thread"
		end

		def current_user=(user)
			raise "user must not be nil" if user.nil?
			Thread.current[@@var_name] = user
		end

		def current_user?
			!!current_user
		end

		def clear_current_user
			Thread.current[@@var_name] = nil
		end

	end
end