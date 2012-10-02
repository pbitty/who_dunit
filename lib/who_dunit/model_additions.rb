module WhoDunit
	module ModelAdditions
		def whodunit(options = {})
			options = {user_class: User}.merge(options)

			belongs_to :created_by, class_name: options[:user_class]
			belongs_to :updated_by, class_name: options[:user_class]

			before_create WhoDunit::Callbacks
			before_save WhoDunit::Callbacks
		end
	end

	class Callbacks
		extend WhoDunit::Core

		def self.before_create(model)
			model.created_by = self.current_user if self.current_user?
		end

		def self.before_save(model)
			model.updated_by = self.current_user if self.current_user?
		end
	end
end