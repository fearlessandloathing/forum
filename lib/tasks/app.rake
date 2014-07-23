namespace :app do
  desc "Update markdown on all posts"
  task update_markdown: :environment do
    Rails.logger.level = Logger::DEBUG
    i = 0
    Post.all.each do |p|
      print "Processing: " + p.id.to_s + "\r"
      $stdout.flush
      p.save!
      i += 1
    end

    puts "\nProcessed " + i.to_s
  end

end
