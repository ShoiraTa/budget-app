class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[ show edit update destroy ]

  # GET /expenditures or /expenditures.json
  def index
    @expenditures = Expenditure.all
  end

  # GET /expenditures/1 or /expenditures/1.json
  def show
  end

  # GET /expenditures/new
  def new
    @expenditure = Expenditure.new
  end

  # GET /expenditures/1/edit
  def edit
  end

  # POST /expenditures or /expenditures.json
  def create
    @expenditure = Expenditure.new(expenditure_params)

    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to expenditure_url(@expenditure), notice: "Expenditure was successfully created." }
        format.json { render :show, status: :created, location: @expenditure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenditures/1 or /expenditures/1.json
  def update
    respond_to do |format|
      if @expenditure.update(expenditure_params)
        format.html { redirect_to expenditure_url(@expenditure), notice: "Expenditure was successfully updated." }
        format.json { render :show, status: :ok, location: @expenditure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    @expenditure.destroy

    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: "Expenditure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expenditure
      @expenditure = Expenditure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expenditure_params
      params.require(:expenditure).permit(:name, :amount, :user_id, :group_id)
    end
end
