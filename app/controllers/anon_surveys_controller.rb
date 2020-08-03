class AnonSurveysController < ApplicationController

  def create
    anon = AnonSurvey.new
    anon.survey = survey

    add_questions_to(anon)

    if anon.save
      render json: 
      {
        :survey => survey,
        :anon => anon,
        :code=>200, 
        :message=>"Successful!!"
      }
    else
      begin
        anon.save!
      rescue ActiveRecord::RecordInvalid => e
        render json: {:code=>422, :message=>e}
      else
        render json: nil, status: :ok
      end
    end

  end

  private

    def survey
      survey = Survey.find_by_contentful_id(params["contentful_id"])
    end

    def add_questions_to(anon)
      params["questions"].each do |question|
        q = Question.new(title: question["question"])
        if question["selected"]
          choice = Choice.create(title: question["selected"])
          q.choices << choice
        end
        q.save
        anon.questions.push(q)
      end
    end

end
