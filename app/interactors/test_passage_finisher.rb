class TestPassageFinisher
  include Interactor

  def call
    test_passage = context.test_passage
    #TestsMailer.completed_test(test_passage).deliver_now
    test_passage.evaluation = true
    test_passage.save!
  end
end
