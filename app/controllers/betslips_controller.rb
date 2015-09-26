class BetslipsController < ApplicationController
  before_action :set_betslip, only: [:show, :edit, :update, :destroy]

  # GET /betslips
  # GET /betslips.json
  def index
    @betslips = Betslip.all
    @game = Game.all
  end

  # GET /betslips/1
  # GET /betslips/1.json
  def show
    @betslip = Betslip.find(params[:id])
    @game = @betslip.games.all
  end

  # GET /betslips/new
  def new
    @betslip = Betslip.new
    @betslip.games.new
  end

  # GET /betslips/1/edit
  def edit
  end

  # POST /betslips
  # POST /betslips.json
  def create
    @account = current_user.accounts.last
    
    @betslip = @account.betslips.create(betslip_params)

    respond_to do |format|
      if @betslip.save
        format.html { redirect_to @betslip, notice: 'Betslip was successfully created.' }
        format.json { render :show, status: :created, location: @betslip }
      else
        format.html { render :new }
        format.json { render json: @betslip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /betslips/1
  # PATCH/PUT /betslips/1.json
  def update
    respond_to do |format|
      if @betslip.update(betslip_params)
        format.html { redirect_to @betslip, notice: 'Betslip was successfully updated.' }
        format.json { render :show, status: :ok, location: @betslip }
      else
        format.html { render :edit }
        format.json { render json: @betslip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /betslips/1
  # DELETE /betslips/1.json
  def destroy
    @betslip.destroy
    respond_to do |format|
      format.html { redirect_to betslips_url, notice: 'Betslip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_betslip
      @betslip = Betslip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def betslip_params
      params.require(:betslip).permit(:stake, :winnings, :total_odds, :status, games_attributes: [:id, :match, :type_bet, :selection, :odds, :status, :_destroy])
    end
end
