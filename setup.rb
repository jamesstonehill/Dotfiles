#!/usr/bin/ruby

# zsh setup
puts "Setting up ZSH"

ZSHRC_DESTINATION_PATH = Pathname.new("../test.txt")
ZSHRC_SOURCE_PATH = Pathname.new("./zsh/.zshrc")

if ZSH_FILE_PATH.exist?
  puts "A .zshrc file already exists."
  puts "Would you like to overwrite it or append to it? (o/A)"
  response = gets.chomp.downcase

  acceptable_answers = ["o", "a", ""]

  while !acceptable_answers.include?(response)
    puts "That was not a valid input. Please try again."
    response = gets.chomp.downcase
  end
end
