module SetupFixtures
  PathHere = File.dirname(__FILE__)
  $LOAD_PATH.unshift File.join(PathHere, "..", "lib")

  FixturePath = File.join(PathHere, "fixtures")

  TestUrl = "http://example.sheets/"

  GoodSheets = {
    "coin1.png" => [440, 40]
  }

  GoodSheets.each do |name, info|
    FakeWeb.register_uri(:get, "#{TestUrl}#{name}", 
                         :body => File.join(FixturePath, name))
  end
end
