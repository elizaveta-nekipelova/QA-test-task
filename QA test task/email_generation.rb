def generateEmail
  return "test" + rand(100..10000).to_s + "@testing.com"
end