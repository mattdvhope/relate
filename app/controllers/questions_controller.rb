class QuestionsController < ApplicationController

  def create

    # must bring in Question to have a valid Choice 


    questions = []
    params["questions"].each do |question|
      questions.push(question)
# binding.pry
    end

    # params["selected"].each do |sel|
    #   Choice.create()
    # end

    render json: 
      {
        :selections => questions,
        :code=>200, 
        :message=>"Successful!!"
      }
  end

end
