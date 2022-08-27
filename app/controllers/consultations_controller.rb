class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:update, :edit, :show, :destroy]

  def index
    @consultations = Consultation.where(user: current_user)
  end

  def new
    @consultation = Consultation.new
    @procedure = Procedure.find(params[:procedure_id])
  end

  def create
    @consultation = Consultation.new
    @user = current_user
    @consultation.user = @user
    @procedure = Procedure.find(params[:procedure_id])
    @consultation.procedure = @procedure
    if @consultation.save
      step_path = Rails.root.join
      @chatroom = Chatroom.new(name: "Chat Room")
      @consultation.chatroom = @chatroom

    step1 = Step.create(
      name: "1 - Application Form",
      consultation: @consultation,
      instruction: "Please fill in the application form (永住許可申請書) and upload the form"
    )

    item1 = Item.create(
      name: "Application Form",
      description: File.open("#{step_path}/items/item1.md").read,
      step: step1
    )

    step2 = Step.create(
      name: "2 - Upload a photograph",
      consultation: @consultation,
      instruction: "Please upload photograph based on MOJ website requirements"
    )

    item2 = Item.create(
      name: "Upload a photograph",
      description: File.open("#{step_path}/items/item2.md").read,
      step: step2
    )

    step3d = Step.create(
      name: "3.d - Proof of Employment Status",
      consultation: @consultation,
      instruction: "Provide 1 copy of the following documents:"
    )

    item3d_1 = Item.create(
      name: "If employed - Provide Certificate of Employment",
      description: File.open("#{step_path}/items/item3d_1.md").read,
      step: step3d
    )

    item3d_2 = Item.create(
      name: "If self employed - Provide copy of the applicant's tax return, or the corporations' certificate of registered matters",
      description: File.open("#{step_path}/items/item3d_2.md").read,
      step: step3d
    )

    item3d_3 = Item.create(
      name: "Other - Clarifying documents or other demonstrative materials which detail their employment (no specified format)",
      description: File.open("#{step_path}/items/item3d_3.md").read,
      step: step3d
    )
      redirect_to profile_path(anchor: "consultations")
    else
      render :new
    end
  end

  def show
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    @markdown = Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def edit
    @lawfirm = Lawfirm.find(params[:lawfirm_id])
  end

  def update
    @lawfirm = Lawfirm.find(params[:lawfirm_id])
    @consultation.lawfirm = @lawfirm
    @consultation.save
    redirect_to consultation_path(@consultation)
  end

  def destroy
    @consultation.destroy
    redirect_to profile_path(anchor: "consultations")
  end

  private

  # def consultation_params
  #   params.require(:consultation).permit()
  # end

  def set_consultation
    @consultation = Consultation.includes(steps: :items).find(params[:id])
  end
end
