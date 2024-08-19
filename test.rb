# frozen_string_literal: true

Rails.logger.debug "Running test for #{Rails.version}"
user = User.create!
post = Post.create!
user.posts << post
post.reload.users.include?(user) || (raise StandardError, "User not loaded")
user.reload.posts.include?(post) || (raise StandardError, "Post not loaded")

process = Admin::Process.create!

user.admin_processes << process

process.reload.users.include?(user) || (raise StandardError, "Admin/Process not loaded")

# Common namespace
cp = ChefProcess.create!
cp.chef_scripts.create!
