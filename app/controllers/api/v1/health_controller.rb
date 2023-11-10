module Api
  module V1
    class HealthController < Api::V1::ApiController
      def status
        render json: { online: true }
      end
    end
  end
end
