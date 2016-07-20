# encoding: utf-8
# inject text at matching location
module InjectAtMatch
  def self.inject(filename, pattern, new_text, options)
    puts options
    bk_filename = backup_original_file filename

    newfile = create_newfile_with_injection bk_filename, pattern, new_text, options

    show_output newfile, options

    File.new(filename, 'w+').write newfile.join ''
    File.delete bk_filename if options[:wildside]
  end

  def self.backup_original_file(filename)
    bk_filename = "#{filename}__bk"
    FileUtils.mv(filename, bk_filename) # COPY ORIGINAL FILE TO BACKUP
    bk_filename
  end

  def self.create_newfile_with_injection(bk_filename, pattern, new_text, options)
    newfile = []
    File.open(bk_filename, 'r').each_line {|line|
      if options[:before]
        newfile << "#{new_text}\n" if line.match pattern
        newfile << line
      else
        newfile << line
        newfile << "#{new_text}\n" if line.match pattern
      end
    }.close
    newfile
  end

  def self.delete_line_number(file, line_number_to_delete)
    original_file = "./#{file}"
    new_file = "#{original_file}.new"
    counter = 1
    File.open("#{new_file}", 'w') do |fo|
      File.foreach(original_file) do |li|
        if counter != line_number_to_delete.to_i
          puts li
          fo.puts li
        end
        counter = counter + 1
      end
    end
    File.delete("#{original_file}")
    File.rename("#{new_file}", "#{original_file}")
  end

  def self.show_output(newfile, options)
    unless options[:no_output]
      puts "OUTPUT\n-------"
      puts newfile
    end
  end
end
