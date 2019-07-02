# if $stdin.tty?
#   ARGV.each do |file|
#     puts "do something with this file: #{file}"
#   end
# else
#   $stdin.each_line do |line|
#     puts "do something with this line: #{line}"
#   end
# end

#
#
# while STDIN.gets
#   puts $_
# end
#
# while ARGF.gets
#   puts $_
# end
#
#
# all_lines = ""
# ARGV.each do |line|
#   all_lines << line + "\n"
# end
# puts all_lines
#
#
#
# File.open(ARGV[0], 'w') do |file|
#   ARGV.clear
#
#   ARGF.each do |line|
#     puts line
#     file.write(line)
#   end
# end
#
#
# STDIN.gets.chomp == 'YES'
#
#
# while a=(ARGV.shift or (!STDIN.tty? and STDIN.gets) )
#   puts a
# end
#
#
if ARGV.length != 1
  puts "We need exactly one parameter. The name of a file."
  exit;
end

filename = ARGV[0]
puts "Going to open '#{filename}'"

fh = open filename

fh.each do |line|
  p line
end

fh.close





File.open("names.txt") do |f|
  f.each do |readl|
    name, last_name, year = readl.chomp.split(";")
    puts "First name: #{name}, last name #{last_name}, year #{year}"
  end
end




count = 0
total_ages = File.readlines("names.txt").inject(0) do |total,line|
  count += 1
  fields = line.chomp.split(";")
  age = fields[2].to_i
  total + age
end





Для работы с директориями, также как и для работы с файлами существует класс Dir
p d = Dir.new("/lib")
p d.entries # выведется массив содержащий список файлов и папок
Обычно класс Dir используется совместно с классом File. Рассмотрим пример как вычислить размер всех файлов в директории:
                                                                                                                 d = Dir.new("/lib")
entries = d.entries
entries.delete_if { |entry| entry =~ /^\./ } # удалим из массива директории
entries.map! { |entry| File.join(d.path,entry) } # добавим к элементам массива содержащим названия файлов полный путь
entries.delete_if { |entry| !File.file?(entry) } # удалим элементы массива которые не являются файлами
puts "Total size of all files"
puts entries.inject(0) { |total,entry| total+File.size(entry) } # суммируем размеры всех файлов
Результат работы программы:
                     Total size of all files
3195792
Для создания директории используется метод mkdir, для навигации chdir, для удаления rmdir.




                                                                                        1



data = []

File.open('source.txt', 'r') do |file|
  file.each_line { |x| data.push(x) }
end

changed_data = data.map do |x|
  # TODO: Change data
end

File.open('output.txt', 'w') do |file|
  changed_data.each { |x| file.puts(x) }
end







f = File.new("lib/file.rb")
f.each do |line|
  #делаем что-то со строкой
end
f.close






f = File.new('lib/file.rb', 'w')
f.puts("a new line will be appended")
f.print("no new line")
f.print(" at all")
puts f.read
>> "a new line will be appended\nno new line at all"
f.close






File.open("lib/file.rb") do |f|
  f.each do
    #делаем что-то
  end
end



Итак, теперь мы знаем как убрать из строки все ненужные символы:

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"








lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join
word_count = text.split.length
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, '').length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"







. В первом случае файл не нужно явно открывать.
# Напечатать все строки, содержащие слово "target".
    IO.foreach("somefile") do |line|
  puts line if line =~ /target/
end

# Другой способ...
file = File.new("somefile")
file.each do |line|
  puts line if line =~ /target/
end








line_num=0
text=File.open('xxx.txt').read
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
  print "#{line_num += 1} #{line}"
end








File.readlines('foo').each do |line|






  File.foreach(filename).with_index do |line, line_num|
    puts "#{line_num}: #{line}"
  end
  Это будет выполнять данный блок для каждой строки в файле, не опуская весь файл в память. См. IO:: foreach.


                                                                                        1








  В вашем первом файле есть окончания строк Mac Classic (thats "\r" вместо обычного "\n"). Откройте его с помощью

  File.open('foo').each(sep="\r") do |line|
    чтобы указать окончания строки.1












    Я частично отношусь к следующему подходу для файлов с заголовками:

                                                              File.open(file, "r") do |fh|
      header = fh.readline
      # Process the header
      while(line = fh.gets) != nil
        #do stuff
      end
    end
    Это позволяет обрабатывать строку заголовка (или строки) иначе, чем строки содержимого.




                                                                                   1
    Это из-за конечных линий в каждой строке. Используйте метод chomp в ruby, чтобы удалить конечную строку '\n' или 'r' в конце.

        line_num=0
    File.open('xxx.txt').each do |line|
      print "#{line_num += 1} #{line.chomp}"
    end
    1






    myFile=File.open("paths_to_file","r")
    while(line=myFile.gets)
      //do stuff with line
    end

