class Cloud9 < Thor
  include Thor::Actions
  
  
  no_commands do
    def debug(message)
      say "[DEBUG] #{message}", :cyan
    end

    def warn(message)
      say "[WARNING] #{message}", :yellow
    end

    def fail_task(message, quit = true)
      say "[FAIL] #{message}", :red
      exit(1) if quit
    end
  end
  
  desc "install", "installs a custom Cloud9 setup"
  def install
    ## generate ssh key
    # email = ask 'What is the email you wish to use for Git commits?'
    # debug 'Generating SSH key'
    # system "ssh-keygen -t rsa -b 4096 -C \"#{email}\" -q -P \"\" -f ~/.ssh/id_rsa"

    # system 'cat ~/.ssh/id_rsa.pub'
    # warn 'Please add the above SSH key to your Github profile (see https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/ for details):'
    
    # ask 'Please hit enter when ready to continue'

    # debug 'Installing Node 8.10'
    # system 'export NVM_DIR=~/.nvm && source ~/.nvm/nvm.sh && nvm i v8.10'
    
    # debug 'Installing Yarn'
    # system 'npm install -g yarn'
    
    # debug 'Installing Bundler'
    # system 'gem install bundler'
    
    # debug 'Installing Webpack'
    # system 'npm install webpack-cli -g'
    
    # debug 'Installing Babel'
    # system 'npm install babel-cli -g'
    
    debug 'Install dotfiles'
    Dir.chdir('/home/ec2-user') do
      system 'git clone git@github.com:schof/dotfiles.git .dotfiles'
      system 'cd .dotfiles'
      system './install.rb'
    end

  end
end
