class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    # @food = Food.new(food_params)
    @food = current_user.foods.build(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
