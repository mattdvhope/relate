class QuestionsController < ApplicationController

  def create
    array = []
    params["selected"].each {|sel| array.push(sel["choice"])  }
    render json: 
      {
        :selections => array,
        :code=>200, 
        :message=>"Successful!!"
      }
  end

end
