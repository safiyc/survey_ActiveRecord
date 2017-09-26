require("spec_helper")

describe(Survey) do

  it('returns survey as capitalized letters') do
    survey = Survey.create({:name => "season"})
  expect(survey.name).to eq("SEASON")
  end
end
