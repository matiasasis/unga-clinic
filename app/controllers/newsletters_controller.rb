class NewslettersController < BackofficeController
  before_action :set_newsletter, only: %i[ show edit update destroy ]

  # GET /newsletters
  def index
    @newsletters = Newsletter.paginate(page: params[:page], per_page: 12)
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit
  end

  # POST /newsletters
  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      redirect_to newsletters_url, notice: "#{I18n.t('activerecord.models.newsletter.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /newsletters/1
  def update
    if @newsletter.update(newsletter_params)
      redirect_to newsletters_url, notice: "#{I18n.t('activerecord.models.newsletter.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /newsletters/1
  def destroy
    @newsletter.destroy
    redirect_to newsletters_url, notice: "#{I18n.t('activerecord.models.newsletter.one')} eliminado exitosamente."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
