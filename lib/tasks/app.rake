namespace :app do
  desc "Update markdown on all posts"
  task update_markdown: :environment do
    Rails.logger.level = Logger::DEBUG
    i = 0
    Post.all.each do |p|
      print "Processing: " + p.id.to_s + "\r"
      $stdout.flush
      p.update_record_without_timestamping
      i += 1
    end

    puts "\nProcessed " + i.to_s
  end

  desc "Reset updated_at to created_at"
  task reset_updated: :environment do
    Post.all.each do |x|
      x.updated_at = x.created_at
      x.update_record_without_timestamping
    end

    ForumThread.all.each do |x|
      x.updated_at = x.created_at
      x.update_record_without_timestamping
    end
  end

end
