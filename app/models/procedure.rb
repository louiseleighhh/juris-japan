class Procedure < ApplicationRecord
  has_many :consultations
  has_many :steps, through: :consultations
  validates :name, presence: true

  STEP_OUTLINES = {
    # one for each kind of procedure
    PR: {
      steps: [ {name: "Step 1 - Fill in Application form", instruction: "Please   fill in the application form (永住許可申請書) and upload the form"},
        {name: "Step 2 - Upload a photograph", instruction: "Please upload a 40mm x 30mm photo taken in the last three months. See the MOJ website for more details"},
        {name: "Step 3 - Demonstrative Materials", instruction: "Please upload all of the following documents:"},
        {name: "Step 3A - Statement", instruction: "Please upload a statement detailing why you are applying for permanent residency. Please note, any statements will require translation to Japanese"},
        {name: "Step 3B - Proof of identity (if a dependent)", instruction: "Provide 1 copy of the following documents: (1) Family Register (Full Version), (2) Birth Certificate, (3) Marriage Cartificate, (4) Certificate of items recorded on acknowledgement notification, (5) Documents supporting (1) - (4) if they cannot be provided."},
        {name: "Step 3C - Residence Certificate", instruction: "Please omit the My Number (Individual Number), but include all the other information"},
        {name: "Step 3D - Proof of Employment Status", instruction: "(1) If employed - Provide Certificate of Employment, (2) If self employed - Provide copy of the applicant's tax return, or the corporations' certificate of registered matters, (3) Other - Clarifying documents or other demonstrative materials which detail their employment (no specified format) - as required"},
        {name: "Step 3E - Proof of income and tax payment status for past 5 years", instruction: "Please provide the following documents: (1) Tax certificate (or tax exemption) for each of the past 5 years, (2) Tax payment certificate for the last 5 years, (3) Proof of payment of inhabitant taxes (bankbook copies, receipts etc.., (4) Proof of payment status of national taxes (No. 3 tax certificates for withholding tax, Special Income Tax for Reconstruction, self-declared income tax, consumption tax, local consumption tax, inheritance tax, and donation tax) x1 of each, (5) Proof of income (bankbook copy)"},
        {name: "Step 3F - Proof of Pension and Medical Insurance Premiums", instruction: "(1) Proof of payment of pension for past two years, (2) Pension Coverage Regular Notice (Nenkin Teiki Bin) OR Screenshots of Nenkin Net 'Monthly Pension Records' OR National pension insurance premium receipts"},
        {name: "Step 3G - Proof of Assets", instruction: "Please provide copies of (1) your bankbook and (2) Certificate of registerd matters for real estate"},
        {name: "Step 3H - Materials related to Guarantor", instruction: "Please provide the following documents: (1) Guarantor form - find the form on the MoJ website, (2) Documents proving employment (as required), (3) Documents proving income for the past year, (4) Residence Certificate"},
        {name: "Step 3I - Proof of Contributions to Japan (if applicable)", instruction: "Please provide any proof of Contributions to Japan"},
        {name: "Step 4 - Residence Card", instruction: "Upload only if applying via a proxy, otherwise please produce your card at the immigration office"},
        {name: "Step 5 - Written Permission", instruction: "Provide written permission to engage in an activity other than those permitted by the status of residence, previously granted (where applicable)"},
        {name: "Step 6 - Passport / Certificate of Eligibility (COE)", instruction: "Upload only if applying via a proxy, otherwise please produce your passport or CoE at the immigration office"},
        {name: "Step 7 - *Proxy Only* Documents certifying identity", instruction: "Please produce ID at immigration office"} ]
    },
    divorce: {
      steps: [ {name: "Step 1", instruction: "What do you need to do"}, {name: "Step 1", instruction: "What do you need to do"}, {name: "Step 2", instruction: "What do you need to do"}, {name: "Step 3", instruction: "What do you need to do"} ]
    },
  }
  def create_steps(consultation_id)
    steps = STEP_OUTLINES[self.name.to_sym]
    steps[:steps].each do |step|
      puts step.inspect

      Step.create!(name: step[:name], instruction: step[:instruction], consultation_id: consultation_id, status: 0)
    end
  end
end

# {name: "", instruction: ""}
