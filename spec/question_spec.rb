require("spec_helper")

describe(Question) do

  it("prevents user from creating empty input field") do
    question = Question.create({:name => ""})
  expect(question.save). to eq(false)
  end

end
