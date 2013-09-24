class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  add_crumb "Lists", :lists_path
  # GET /items
  # GET /items.json
  def index
    @list = List.find(params[:list_id])
    @items = @list.items
    @newItem = Item.new
    add_crumb @list.name, list_path(@list) 
    add_crumb "Items", list_items_path(@list)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    add_crumb @item.list.name, list_path(@item.list) 
    add_crumb @item.name, item_path(@item)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @list = List.find(params[:list_id])
    @item.list = @list

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_path(@list), notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @list = @item.list
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_url(@list) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :list_id)
    end
end
