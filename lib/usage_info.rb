# encoding: utf-8
# help text for inject_at_match
module UsageInfo
  def self.usage_section
    puts '-----------------------------------------------------------------------------'
    puts 'USAGE:        inject_at_match filename [opts] regex text'
    puts '------------------------------------------------'
  end

  def self.definition_section
    puts ' injects given text into a file before or after all lines that'
    puts ' partially or fully match a given "matcher" string or regex.'
    puts '------------------------------------------------'
  end

  def self.arguments_section
    puts 'ARGUMENTS:'
    puts 'filename:     path to file to modify'
    puts 'regex:        '
    puts 'text:         text to inject into file'
    puts '------------------------------------------------'
  end

  def self.options_section
    puts 'OPTIONS:'
    puts '  --before    inject before match'
    puts '  --after     inject after match'
    puts '  --wildside  create no backup'
    puts '  --help      display this help text'
    puts '------------------------------------------------'
  end

  def self.example_section
    puts 'EXAMPLE:  inject_at_match asdf.txt --after "kittens" "puppies"'
    puts '  Output: '
    puts '             ORIGINAL TEXT   |  NEW TEXT'
    puts '             ----------------+----------------'
    puts '                asdf         |  asdf'
    puts '                kittens      |  kittens'
    puts '                asdf         |  puppies'
    puts '                             |  asdf'
    puts 'EXAMPLE 2: inject_at_match asdf.txt --before "^[^a-zA-Z0-9_]+gem.?{1,4}binding.*" "#binds to things"'
    puts '-----------------------------------------------------------------------------'
  end

  def self.usage
    usage_section
    definition_section
    arguments_section
    options_section
    example_section
  end
end
