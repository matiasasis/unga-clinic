# frozen_string_literal: true

class ContactsController < BackofficeController
  before_action :set_contact, only: %i[edit update destroy]

  # GET /contacts
  def index
    @contacts = Contact.paginate(page: params[:page], per_page: 12)
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit; end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_url, notice: "#{I18n.t('activerecord.models.contact.one')} creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to contacts_url, notice: "#{I18n.t('activerecord.models.contact.one')} modificado exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: "#{I18n.t('activerecord.models.contact.one')} eliminado exitosamente."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
