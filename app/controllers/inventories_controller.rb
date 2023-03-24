class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]

  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = InventoryFood.includes(:food).where(inventory_id: @inventory.id)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_url, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
