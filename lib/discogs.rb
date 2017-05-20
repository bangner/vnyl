module Discogs
  extend self

  def fetch_user_collection user
    # FIXME - Should work for any amount
    if query = $discogs.get_user_collection(user.discogs_username, per_page:500)
      if releases = query["releases"]
        find_or_create_album user, releases
      else
        puts "No releases for User: #{user}, Discogs Username: #{user.discogs_username}"
      end
    else
      puts "Can't get User Collection for User: #{user}, Discogs Username: #{user.discogs_username}"
    end
  end

  # FIXME - Pagination?
  def find_or_create_album user, releases
    releases.each do |rel|

      Album.find_or_create_by(artist:      rel["basic_information"]["artists"][0]["name"],
                              title:       rel["basic_information"]["title"],
                              thumbnail:   rel["basic_information"]["thumb"],
                              discogs_url: rel["basic_information"]["resource_url"],
                              user_id:        user.id)
    end
  end

end