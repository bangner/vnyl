desc "Fetches All User's Discogs Collection"
task :record_miner => :environment do
  puts "Updating User's Collections"
  users = User.all
  users.each do |user|
    Discogs.fetch_user_collection user
  end
end

