require 'rake'
require 'faker'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Populate the database'
task "db:populate" do
  user1 = User.create(username: "Jan Jansen", password: "12345", email: "jansen@gmail.com")
  user2 = User.create(username: "Minsc", password: "12345", email: "daniel@gmail.com")
  user3 = User.create(username: "Khuram Virani", password: "12345", email: "virani@gmail.com")
  user4 = User.create(username: "Don Burks", password: "12345", email: "george@lighthouselabs.ca")
  user5 = User.create(username: "Jeremy Shaki", password: "12345", email: "hank@lighthouselabs.com")
  d1 = Document.create(user_id: user1.id, title: "Turnips: The Enduring Mystery", description: "A rousing disquisition concerning the most humble, yet grand and controversial of vegetables. With many quotes from my uncle Dipwiddle the 3rd.", author: "Author's Name", )
  d2 = Document.create(user_id: user2.id, title: "Boo, the Miniature Giant Space Hamster", description: "They tell me I am crazy, that Boo is just a regular hamster, but I know the truth. He is what he is. He is Boo, and he is a miniature giant space hamster! He came to me after my head injury, and we have been friends ever since!", author: "Author's Name", )
  d3 = Document.create(user_id: user3.id, title: "Spelling is for Sukkers", description: "My csae for why spleling is not ncessesry in the lsaet.", author: "Author's Name", )
  d4 = Document.create(user_id: user4.id, title: "The Durian: Fascinating and Fantastic", description: "A fruit (I think?) most stinky, but spiky and full of comic potential. I shall take you through the joy that is the durian.", author: "Author's Name", )
  d5 = Document.create(user_id: user5.id, title: "Shakil the Dog", description: "You are in a room with Shakil the Dog. What do you say? Whatever you decide, be sure to hide your garbage.", author: "Author's Name", )
  p11 = Paragraph.create(body: "<p>The turnip or white turnip (Brassica rapa subsp. rapa) is a root vegetable commonly grown in temperate climates worldwide for its white, bulbous taproot. Small, tender varieties are grown for human consumption, while larger varieties are grown as feed for livestock.</p>", position: 1, document_id: d1.id)
  p12 = Paragraph.create(body: "<p>In the north of England and Scotland, turnip (or neep; the word turnip itself is an old compound of neep) refers to the larger, yellow rutabaga root vegetable which is also known as the 'swede' (from 'Swedish turnip').The turnip's root is high in vitamin C. The green leaves of the turnip top ('turnip greens') are a good source of vitamin A, folate, vitamin C, vitamin K and calcium. Turnip greens are high in lutein (8.5 mg / 100 g).</p>", position: 2, document_id: d1.id)
  p13 = Paragraph.create(body: "<p>Like rutabaga, turnip contains bitter cyanoglucosides that release small amounts of cyanide. Sensitivity to the bitterness of these cyanoglucosides is controlled by a paired gene. Subjects who have inherited two copies of the 'sensitive' gene find turnips twice as bitter as those who have two 'insensitive' genes, and thus may find turnips and other cyanoglucoside-containing foods intolerably bitter.", position: 3, document_id: d1.id)
  p14 = Paragraph.create(body: "<p>There is evidence that the turnip was domesticated before the 15th century BC; it was grown in India at this time for its oil-bearing seeds.[3] The turnip was a well-established crop in Hellenistic and Roman times, which leads to the assumption that it was brought into cultivation earlier. Sappho, a Greek poet from the 7th century BC, calls one of her paramours Gongýla, 'turnip'. Zohary and Hopf note, however, 'there are almost no archaeological records available' to help determine its earlier history and domestication. Wild forms of the hot turnip and its relatives the mustards and radishes are found over west Asia and Europe, suggesting their domestication took place somewhere in that area. However Zohary and Hopf conclude, 'Suggestions as to the origins of these plants are necessarily based on linguistic considerations.'As a root crop, turnips grow best in cool weather; hot temperatures cause the roots to become woody and bad-tasting. They are typically planted in the spring in cold-weather climates (such as the northern US and Canada) where the growing season is only 3–4 months. In temperate climates (ones with a growing season of 5–6 months), turnips may also be planted in late summer for a second fall crop. In warm-weather climates (7 or more month growing season), they are planted in the fall. 55–60 days is the average time from planting to harvest.", position: 4, document_id: d1.id)
  p21 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 1, document_id: d2.id)
  p22 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 2, document_id: d2.id)
  p23 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 3, document_id: d2.id)
  p31 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 1, document_id: d3.id)
  p32 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 2, document_id: d3.id)
  p33 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 3, document_id: d3.id)
  p41 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 1, document_id: d4.id)
  p42 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 2, document_id: d4.id)
  p43 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 3, document_id: d4.id)
  p51 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 1, document_id: d5.id)
  p52 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 2, document_id: d5.id)
  p53 = Paragraph.create(body: "<p>#{Faker::Lorem.paragraph(15)}</p>", position: 3, document_id: d5.id)
  c01 = Comment.create(user_id: user1.id, paragraph_id: p21.id, content: Faker::Lorem.sentence(1))
  c02 = Comment.create(user_id: user2.id, paragraph_id: p31.id, content: Faker::Lorem.sentence(1))
  c03 = Comment.create(user_id: user3.id, paragraph_id: p41.id, content: Faker::Lorem.sentence(1))
  c04 = Comment.create(user_id: user4.id, paragraph_id: p22.id, content: Faker::Lorem.sentence(1))
  c05 = Comment.create(user_id: user5.id, paragraph_id: p23.id, content: Faker::Lorem.sentence(1))
  c06 = Comment.create(user_id: user4.id, paragraph_id: p33.id, content: Faker::Lorem.sentence(1))
  c07 = Comment.create(user_id: user3.id, paragraph_id: p42.id, content: Faker::Lorem.sentence(1))
  c08 = Comment.create(user_id: user2.id, paragraph_id: p52.id, content: Faker::Lorem.sentence(1))
  c09 = Comment.create(user_id: user3.id, paragraph_id: p51.id, content: Faker::Lorem.sentence(1))
  c10 = Comment.create(user_id: user5.id, paragraph_id: p41.id, content: Faker::Lorem.sentence(1))
  c11 = Comment.create(user_id: user1.id, paragraph_id: p42.id, content: Faker::Lorem.sentence(1))
  c12 = Comment.create(user_id: user1.id, paragraph_id: p23.id, content: Faker::Lorem.sentence(1))
  c13 = Comment.create(user_id: user2.id, paragraph_id: p21.id, content: Faker::Lorem.sentence(1))
  c14 = Comment.create(user_id: user3.id, paragraph_id: p32.id, content: Faker::Lorem.sentence(1))
  c15 = Comment.create(user_id: user2.id, paragraph_id: p41.id, content: Faker::Lorem.sentence(1))
  c16 = Comment.create(user_id: user4.id, paragraph_id: p21.id, content: Faker::Lorem.sentence(1))
  c17 = Comment.create(user_id: user2.id, paragraph_id: p53.id, content: Faker::Lorem.sentence(1))
  c18 = Comment.create(user_id: user1.id, paragraph_id: p22.id, content: Faker::Lorem.sentence(1))
  c19 = Comment.create(user_id: user3.id, paragraph_id: p31.id, content: Faker::Lorem.sentence(1))
  c20 = Comment.create(user_id: user5.id, paragraph_id: p42.id, content: Faker::Lorem.sentence(1))
  c21 = Comment.create(user_id: user2.id, paragraph_id: p51.id, content: Faker::Lorem.sentence(1))
  c22 = Comment.create(user_id: user5.id, paragraph_id: p21.id, content: Faker::Lorem.sentence(1))
end