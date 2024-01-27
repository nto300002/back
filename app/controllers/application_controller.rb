class ApplicationController < ActionController::API
        include Secured
        rescue_from StandardError do |e|
                render json: { message: e.message }, status: :internal_server_error
        end
end
