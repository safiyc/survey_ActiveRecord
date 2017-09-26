require("spec_helper")

describe(Survey) do

  it('returns survey as capitalized letters') do
    survey = Survey.create({:name => "season"})
  expect(survey.name).to eq("SEASON")
  end

  it("prevents user from creating empty input field") do
    survey = Survey.create({:name => ""})
  expect(survey.save). to eq(false)
  end
end
