class QuestionsController < ApplicationController

  def create

    # must bring in Question to have a valid Choice

    array = []
    params["selected"].each {|sel| array.push(sel["choice"])  }

    params["selected"].each do |sel|
      Choice.create()
    end

    render json: 
      {
        :selections => array,
        :code=>200, 
        :message=>"Successful!!"
      }
  end

end
