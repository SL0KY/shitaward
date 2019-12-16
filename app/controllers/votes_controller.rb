class VotesController < ApplicationController
  
    def create
      vote =  Website.find_by(id: params[:website_id]).votes.build(votes_params)
      if vote.save
        flash[:success] = 'Upvote enregistré'
      else
        flash[:error] = 'Imppssible d\upvoté'
      end
      redirect_to websites_path
    end
  
    private 

    def votes_params
        params.require(:vote).permit(:type)
    end
  end