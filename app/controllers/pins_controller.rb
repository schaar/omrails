class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index
     @pins = Pin.order("created_at desc").page(params[:page]).per_page(20)

      respond_to do |format|
        format.html # index.html.erb
        
        format.json { render json: @pins }
   end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.new
  end

  # GET /pins/1/edit
  def edit
    @pin = current_user.pins.find(params[:id])
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = current_user.pins.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pin }
      else
        format.html { render action: 'new' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    @project = current_user.pins.find(set_pin)
    respond_to do |format|
    if @pin.update(pin_params)
      format.html { redirect_to @pin, notice: 'Project was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: 'edit' }
      format.json { render json: @pin.errors, status: :unprocessable_entity }
end
end
end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin = current_user.pins.find(set_pin)
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :image_remote_url)
    end
end

