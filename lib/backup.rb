require 'pathname'

BACKUP_PATH = Pathname.new('./backups')
DOTFILE_DESTINATION_DIR = Pathname.new('..')
SOURCE_DOTFILES_DIR = Pathname.new('./source_dotfiles')

def backup_file(file_path)
  Dir.mkdir(BACKUP_PATH) unless BACKUP_PATH.exist?
  puts "backing up #{file_path.basename} into #{BACKUP_PATH.realpath}"

  new_path = BACKUP_PATH + file_path.basename

  File.rename(file_path, new_path)
end

def source_directories
  SOURCE_DOTFILES_DIR.children
end

def source_dotfiles
  source_directories.map { |dir| dir.children }.flatten
end

def backup_existing_files
  source_dotfiles.each do |source_dotfile|
    destination_dotfile = DOTFILE_DESTINATION_DIR + source_dotfile.basename

    backup_file(destination_dotfile) if destination_dotfile.exist?
  end
end

class DotfileBackuper
  attr_reader :dotfiles_location, :file_names

  BACKUP_PATH = Pathname.new('/backups')

  def initialize(dotfiles_location, file_names)
    @dotfiles = Pathname.new(
  end

  def perform
    
  end

  private

  def dotfiles
      
  end
end

