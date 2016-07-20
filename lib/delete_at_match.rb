
require 'fileutils'

module DeleteAtMatch

  def delete_line_number(file, line_number_to_delete)
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

  def usage(error)
    puts error
    puts '-- delete_line -------------------------------------------'
    puts 'USAGE:       delete_line filename line_number_to_delete'
    puts 'Example:     delete_line test.txt 4'
    puts '-----------------------------------------------------------'
  end
end