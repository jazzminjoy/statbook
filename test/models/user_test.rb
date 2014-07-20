require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:michele).profile_name
		user.email = "micky@gmail.com"
		assert !user.save

		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'Michele', last_name: 'Buch', email: 'tigerrosere@gmail.com')
		user.password = user.password_confirmation = 'password1'

		user.profile_name = "My Profile Name With Spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'Michele', last_name: 'Buch', email: 'tigerrosere@gmail.com')
		user.password = user.password_confirmation = 'password1'

		user.profile_name = "Michelle_Buch-1"
		assert user.valid?
	end
  # test "the truth" do
  #   assert true
  # end

  		#puts user.errors.inspect
		#puts user.profile_name
end
 