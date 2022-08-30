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

    step3 = Step.create(
      name: "3 - Proof of Employment Status",
      consultation: @consultation,
      instruction: "Provide 1 copy of the following documents:"
    )

    item3_1 = Item.create(
      name: "If employed - Provide Certificate of Employment",
      description: File.open("#{step_path}/items/item3d_1.md").read,
      step: step3
    )

    item3d_2 = Item.create(
      name: "If self employed - Provide copy of the applicant's tax return, or the corporations' certificate of registered matters",
      description: File.open("#{step_path}/items/item3d_2.md").read,
      step: step3
    )

    item3d_3 = Item.create(
      name: "Other - Clarifying documents or other demonstrative materials which detail their employment (no specified format)",
      description: File.open("#{step_path}/items/item3d_3.md").read,
      step: step3
    )

    step4 = Step.create(
      name: "4 - Residence Card",
      consultation: @consultation,
      instruction: "Upload only if applying via a proxy, otherwise please produce your card at the immigration office"
    )

    item4 = Item.create(
      name: "Upload Residence Card",
      description: File.open("#{step_path}/items/item4.md").read,
      step: step4
    )

    step5 = Step.create(
      name: "5 - Written Permission",
      consultation: @consultation,
      instruction: "Provide written permission to engage in an activity other than those permitted by the status of residence, previously granted (where applicable)"
    )

    item5 = Item.create(
      name: "Upload written permission",
      description: File.open("#{step_path}/items/item5.md").read,
      step: step5
    )

    step6 = Step.create(
      name: "6 - Passport / Certificate of Eligibility (COE)",
      consultation: @consultation,
      instruction: "Upload only if applying via a proxy, otherwise please produce your passport or CoE at the immigration office"
    )

    item6 = Item.create(
      name: "Upload Passport or COE",
      description: File.open("#{step_path}/items/item6.md").read,
      step: step6
    )

    step7 = Step.create(
      name: "7 - *Proxy Only* Documents certifying identity",
      consultation: @consultation,
      instruction: "Please produce ID at immigration office"
    )

    item7 = Item.create(
      name: "Documents certifying identity",
      description: File.open("#{step_path}/items/item7.md").read,
      step: step7
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
    redirect_to profile_path(anchor: "consultations")
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
