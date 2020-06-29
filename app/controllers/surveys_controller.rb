class SurveysController < ApplicationController

  def create
    survey = Survey.new(title: params["survey_title"])
    survey.save

    fb_id = params["fb_id"]
    user = User.find_by_fb_id(fb_id)

    us = UserSurvey.new
    us.survey = survey
    us.user = user
    us.save
    
    questions = []
    params["questions"].each do |question|
      questions.push(question)
    end
binding.pry

    # if user.save
      render json: 
      {
        :questions => questions,
        :user => user,
        :code=>200, 
        :message=>"Successful!!"
      }
    # else
    #   begin
    #     user.save!
    #   rescue ActiveRecord::RecordInvalid => e
    #     render json: {:code=>422, :message=>e}
    #   else
    #     render json: nil, status: :ok
    #   end
    # end

  end


end
