class QuestionsController < ApplicationController

  def create
    questions = []
    params["questions"].each do |question|
      questions.push(question)
# binding.pry
    end

    fb_id = params["fb_id"]
    user = User.find_by_fb_id(fb_id)

    # params["selected"].each do |sel|
    #   Choice.create()
    # end

    render json: 
      {
        :questions => questions,
        :user => user,
        :code=>200, 
        :message=>"Successful!!"
      }
  end

end
