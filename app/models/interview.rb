class Interview < ApplicationRecord
  belongs_to :applicant


  after_save do
    schedule if interviewer && start
    applicant.decline if status == 'declined'
    applicant.next if status == 'approved'
  end

  state_machine :status, initial: :unscheduled do
    event :schedule do
      transition unscheduled: :scheduled
    end

    event :approve do
      transition scheduled: :approved
    end

    event :decline do
      transition scheduled: :declined
    end
  end
end
