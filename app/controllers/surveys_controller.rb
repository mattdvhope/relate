class SurveysController < ApplicationController

  def create
    survey = Survey.find_by_contentful_id(params["contentful_id"])
    unless survey
      survey = Survey.new(title: params["survey_title"])
      survey.save
    end

    fb_id   = params["fb_id"]
    line_id = params["line_id"]

    user = User.find_by_fb_id(fb_id) || User.find_by_line_id(line_id) 

binding.pry

    us = UserSurvey.new
    us.survey = survey
    us.user = user
    us.save
    
    params["questions"].each do |question|
      q = Question.new(title: question["question"])
      if question["selected"]
        choice = Choice.create(title: question["selected"])
        q.choices << choice
      end
      q.save
      user.questions.push(q)
    end

    if user.save
      render json: 
      {
        :survey => survey,
        :user => user,
        :code=>200, 
        :message=>"Successful!!"
      }
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
