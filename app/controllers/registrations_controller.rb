class RegistrationsController < Devise::RegistrationsController
	respond_to :json

	def create
		build_resource(sign_up_params)
		resource.save
		UserMailer.with(user: resource).welcome_email.deliver_later
		render json: resource, status: :created
	end
end
