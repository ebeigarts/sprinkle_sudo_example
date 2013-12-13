# Vagrant + Sprinkle broken sudo

```ruby
$ vagrant up
$ bundle exec sprinkle -v -s config.rb
```

Output:

```
% bundle exec sprinkle -v -s config.rb
[app]
--> Cloud hierarchy for policy app
  * requires package test_sudo
Selecting test_sudo for virtual package test_sudo
--> Normalized installation order for all packages: test_sudo

  * test_sudo
--> Checking if test_sudo is already installed for roles: app
test_sudo (test_sudo) verification sequence: test "`md5sum /root/test.txt | cut -f1 -d' '`" = "2debfdcf79f03e4a65a667d21ef9de14" for roles: app

    --> Verifying  (test_sudo)...
  * 2013-12-13 02:58:37 executing `install_test_sudo'
  * executing "sudo -p 'sudo password: ' test \"`md5sum /root/test.txt | cut -f1 -d' '`\" = \"2debfdcf79f03e4a65a667d21ef9de14\""
*** [err :: 127.0.0.1:22222] md5sum:
*** [err :: 127.0.0.1:22222] /root/test.txt
*** [err :: 127.0.0.1:22222] : Permission denied
*** [err :: 127.0.0.1:22222]
test_sudo install sequence: #<Sprinkle::Commands::Transfer:0x007ffa5bd772d0>; sudo mv /tmp/sprinkle_test.txt /root/test.txt for roles: app

    --> Running Sprinkle::Installers::Transfer for roles: app
  * 2013-12-13 02:58:37 executing `install_test_sudo'
 ** scp upload test.txt -> /tmp/sprinkle_test.txt
  * scp upload complete
  * executing "sudo -p 'sudo password: ' sudo mv /tmp/sprinkle_test.txt /root/test.txt"
test_sudo install sequence: touch /root/test.txt for roles: app

    --> Running Sprinkle::Installers::Runner for roles: app
  * 2013-12-13 02:58:37 executing `install_test_sudo'
  * executing "sudo -p 'sudo password: ' touch /root/test.txt"
--> Verifying test_sudo was properly installed for roles: app
test_sudo (test_sudo) verification sequence: test "`md5sum /root/test.txt | cut -f1 -d' '`" = "2debfdcf79f03e4a65a667d21ef9de14" for roles: app

    --> Verifying  (test_sudo)...
  * 2013-12-13 02:58:37 executing `install_test_sudo'
  * executing "sudo -p 'sudo password: ' test \"`md5sum /root/test.txt | cut -f1 -d' '`\" = \"2debfdcf79f03e4a65a667d21ef9de14\""
*** [err :: 127.0.0.1:22222] md5sum:
*** [err :: 127.0.0.1:22222] /root/test.txt
*** [err :: 127.0.0.1:22222] : Permission denied
*** [err :: 127.0.0.1:22222]
/Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/verify.rb:120:in `process': Verifying test_sudo (test_sudo) failed. (Sprinkle::VerificationFailed)
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/package.rb:245:in `block in process_verifications'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/package.rb:243:in `each'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/package.rb:243:in `process_verifications'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/package.rb:230:in `process'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/policy.rb:123:in `block in process'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/policy.rb:122:in `each'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/policy.rb:122:in `process'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/deployment.rb:86:in `block in process'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/deployment.rb:85:in `each'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/deployment.rb:85:in `process'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/script.rb:26:in `sprinkle'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/lib/sprinkle/script.rb:22:in `sprinkle'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bundler/gems/sprinkle-d5f2646d5235/bin/sprinkle:108:in `<top (required)>'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bin/sprinkle:23:in `load'
	from /Users/beigaedg/.rvm/gems/ruby-1.9.3-p327-perf@sprinkle/bin/sprinkle:23:in `<main>'
```