class MallsController < ApplicationController
  autocomplete :mall, :name, :full => true

  def index
    if params[:mall]
      @mall = Mall.where(['name LIKE ?', "%#{params[:mall][:name]}%"]).first
      block_id_string = 'mall_block_id_' + params[:block_id]
      session[block_id_string] = @mall.id
      respond_to do |format|
        format.js { render locals: {block_id: params[:block_id]}}
      end
    else
      @mall = Mall.new
      if !session[:mall_block_id_1]
        @mall1 = Mall.find(1)
        session[:mall_block_id_1] =  @mall1.id
      else
        @mall1 = Mall.find(session[:mall_block_id_1])
      end
      if !session[:mall_block_id_2]
        @mall2 = Mall.find(2)
        session[:mall_block_id_2] =  @mall2.id
      else
        @mall2 = Mall.find(session[:mall_block_id_2])
      end
    end

  end

end
