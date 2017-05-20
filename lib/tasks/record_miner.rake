desc "Fetches All User's Discogs Collection"
task :record_miner => :environment do
  users = User.all
  users.each do |user|
    Discogs.fetch_user_collection user
  end
end

