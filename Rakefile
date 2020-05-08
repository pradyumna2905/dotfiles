require "rake"

desc "install the dot files into user's home directory"
task :install do
  replace_all = false

  Dir["*"].each do |file|
    next if %w[Rakefile README.rdoc LICENSE id_rsa.pub].include? file

    if File.exist?(File.join(ENV["HOME"], ".#{file}"))
      if replace_all
        replace_dotfile(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when "a"
          replace_all = true
          replace_dotfile(file)
        when "y"
          replace_dotfile(file)
        when "q"
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_dotfile(file)
    end
  end

  # TODO: SSH keys

  # Need to do this to make vim use RVM's ruby version
  puts "Moving zshenv to zshrc"
  system %Q{sudo mv /etc/zshenv /etc/zshrc}

  system %Q{mkdir ~/.tmp}
end

def replace_dotfile(file)
  system %Q{rm "$HOME/.#{file}"}
  link_dotfile(file)
end

def link_dotfile(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
