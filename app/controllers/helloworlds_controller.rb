class HelloworldsController < ApplicationController
  before_action :set_helloworld, only: [:show, :edit, :update, :destroy]

  # GET /helloworlds
  # GET /helloworlds.json
  def index
    @helloworlds = Helloworld.all
  end

  # GET /helloworlds/1
  # GET /helloworlds/1.json
  def show
  end

  # GET /helloworlds/new
  def new
    @helloworld = Helloworld.new
  end

  # GET /helloworlds/1/edit
  def edit
  end

  # POST /helloworlds
  # POST /helloworlds.json
  def create
    @helloworld = Helloworld.new(helloworld_params)

    respond_to do |format|
      if @helloworld.save
        format.html { redirect_to @helloworld, notice: 'Helloworld was successfully created.' }
        format.json { render :show, status: :created, location: @helloworld }
      else
        format.html { render :new }
        format.json { render json: @helloworld.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helloworlds/1
  # PATCH/PUT /helloworlds/1.json
  def update
    respond_to do |format|
      if @helloworld.update(helloworld_params)
        format.html { redirect_to @helloworld, notice: 'Helloworld was successfully updated.' }
        format.json { render :show, status: :ok, location: @helloworld }
      else
        format.html { render :edit }
        format.json { render json: @helloworld.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helloworlds/1
  # DELETE /helloworlds/1.json
  def destroy
    @helloworld.destroy
    respond_to do |format|
      format.html { redirect_to helloworlds_url, notice: 'Helloworld was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helloworld
      @helloworld = Helloworld.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def helloworld_params
      params.require(:helloworld).permit(:name, :title)
    end
end
