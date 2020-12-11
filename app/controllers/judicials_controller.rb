class JudicialsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_judicial, only: %i[show destroy]

  def index
    if params[:query].present?
      @judicials = Judicial.search_by_parties_name_and_jud_number(params[:query])
    else
      @judicials = Judicial.all
    end
  end

  def show
  end

  def new
    @judicial = Judicials.new
  end

  def load
    # Carregar dados
  end

  # def create
  #   @job = Job.new(job_params)
  #   @job.user = current_user
  #   authorize @job

  #   if @job.save
  #     redirect_to @job, notice: 'Sua demanda de tradução foi criada com sucesso.'
  #   else
  #     render :new
  #   end
  # end

  def destroy
    @judicial.destroy
    # redirect_to jobs_url, notice: 'A demanda de tradução foi apagada com sucesso.'
  end

  private

  def judicial_params
    params.require(:judicial).permit(:content)
  end

  def set_judicial
    @judicial = Judicial.find(params[:id])
  end
end
