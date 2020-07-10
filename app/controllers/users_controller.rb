class UsersController < ApplicationController

  def create
    person_in_system?
  end

  def update
    # visits = line_person.visits
    # line_person.update(visits: visits + 1)

    # FIX THIS LATER TO RECORD EVERY VISIT!!!!
    render json: {:user => fb_person || line_person, :code=>200, :message=>"Glad to have another visit!!"}
  end

  private

    def person_in_system?
      fb_person || line_person ? update : set_up_user
    end

    def fb_person
      params[:fb_id] ? User.find_by_fb_id(params[:fb_id]) : nil
    end

    def line_person
      params[:line_id] ? User.find_by_line_id(params[:line_id]) : nil
    end

    def set_up_user
      user = User.new(name: params[:name], picture: params[:picture], fb_id: params[:fb_id], line_id: params[:line_id])
      if user.save
        render json: {:user => user, :code=>200, :message=>"Successful creation of new user!!"}
      else
        begin
          user.save!
        rescue ActiveRecord::RecordInvalid => e
          render json: {:code=>422, :message=>e}
        else
          render json: nil, status: :ok
        end
      end
    end

end
