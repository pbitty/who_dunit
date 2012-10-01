module WhoDunit
	module ModelAdditions
		def whodunit(options = {})
			class_eval do
				belongs_to :created_by, class: options[:user_class]
				belongs_to :updated_by, class: options[:user_class]

				## TODO Move callbacks to an observer so we can have access to WhoDunit's scope,
				## to be able to get current_user
				before_create do
					created_by = current_user
				end

				before_save do
					updated_by = current_user
				end
			end
		end
	end

end