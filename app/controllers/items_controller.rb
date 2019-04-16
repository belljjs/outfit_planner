class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :index, :delete, :destroy]
  # before_action :authorize_user!, only: [:new, :create, :index,  :delete, :destroy]

  def new
      @item = Item.new
  end

  def create
      @item = Item.new 
      @item.user = current_user
      @item.count = 0
      @item.season =Season.find(params[:item][:season_id].to_i)
      @item.occasion = Occasion.find(params[:item][:occasion_id].to_i)
      @item.category = Category.find(params[:item][:category_id].to_i)
      @item.color = Color.find(params[:item][:color_id].to_i)
      @item.image = params[:item][:image]
      
      if @item.save
          flash[:success] = "     New item is added!"
          redirect_to new_item_path
      else
          render :new
      end
  end

  def get_sample
      sampler = User.find_by email: 'js@gmail.com'

      #  copy items from Jessie, default account
      sample_items = sampler.items
      sample_items.each do |sample|
          copy_item = sample.dup.tap do |copy|
                          copy.image.attach(sample.image.blob)
                      end
          copy_item.user = current_user
          copy_item.save!
      end

      #  copy outfits from Jessie, default account
      sample_outfits = sampler.outfits
      sample_outfits.each do |sample_outfit|
          copy_outfit = sample_outfit.dup.tap do |outfit_copy|
                           outfit_copy.user = current_user
                      end
          copy_outfit.save!
          
          # copy joints for each outfit
          sample_joints = Joint.where(outfit: sample_outfit) 
          sample_joints.each do |sample_joint|
              copy_joint = sample_joint.dup.tap do |joint_copy|
                              joint_copy.outfit = copy_outfit
                           end
              copy_joint.save!
          end
      end

      redirect_to items_path
  end

  def delete
      @items = current_user.items
      @item = Item.new
  end

  def show
  end

  def destroy
      @item = Item.find_by_id(params[:id])
      if @item.destroy
          render json: {success: true}
      else
          render json: {success: false}
      end
  end

  def index
      @items = current_user.items
      @outfit = Outfit.new
      
      if params[:items]
          if params[:items][:season_id] != ""
              @items = @items.where("season_id = ?", params[:items][:season_id])
          end
          if params[:items][:occasion_id] != ""
              @items = @items.where("occasion_id = ?", params[:items][:occasion_id])
          end
      end
  end

  def item_params
      params.require(:item).permit(
          :categoty_id, 
          :color_id,
          :season_id,
          :occasion_id,
          :image)
  end

  # def authorize_user!
  #     unless can?(:crud, @item)
  #     flash[:danger] = "Access Denied"
  #     redirect_to first_path
  #     end
  # end
end
