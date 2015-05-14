class MallsController < ApplicationController
  autocomplete :mall, :name, :full => true

  def index
    @mall = Mall.new
    @mall1 = Mall.find(1)
    @mall2 = Mall.find(2)
    if params[:search]
      @mall = Mall.where(['name LIKE ?', "%#{params[:term]}%"])

      respond_to do |format|
        format.html
        format.js  { render }
      end
    end

  end


end
