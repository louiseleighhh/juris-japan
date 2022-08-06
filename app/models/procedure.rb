class Procedure < ApplicationRecord
  has_many :consultations
  has_many :steps, through: :consultations
  validates :name, presence: true

  STEP_OUTLINES = {
    immigration: {
      steps: [ {name: "Step 1", instruction: "What do you need to do"}, {name: "Step 1", instruction: "What do you need to do"}, {name: "Step 2", instruction: "What do you need to do"}, {name: "Step 3", instruction: "What do you need to do"} ]
    },
    divorce: {
      steps: [ {name: "Step 1", instruction: "What do you need to do"}, {name: "Step 1", instruction: "What do you need to do"}, {name: "Step 2", instruction: "What do you need to do"}, {name: "Step 3", instruction: "What do you need to do"} ]
    },
    # one for each kind of procedure
  }
  def create_steps(consultation_id)
    steps = STEP_OUTLINES[self.name.to_sym]
    steps.each do |step|
      Step.create!(name: step[:name], instruction: step[:instruction], consultation_id: consultation_id, status: :incomplete)
    end
  end
end
