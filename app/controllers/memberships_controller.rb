class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_reord

    def create
        membership = Membership.create!(membreship_params)
        render json: membership, status: :created
    end

    private

    def membreship_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def invalid_reord(invalid)
        render json: {errors: invalid.record.errors.full_messages}
    end
end
