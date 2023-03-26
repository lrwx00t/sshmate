REPO_URL = https://github.com/lrwx00t/sshmate
REPO_PATH = sshmate

.PHONY: install

install:
	# Clone the repository
	# git clone $(REPO_URL) $(REPO_PATH)
	
	# Create a symlink to sshmate script
	ln -s $(PWD)/sshmate /usr/local/bin/sshmate
	
	# Install the auto-completion script
ifeq ($(shell command -v zsh 2> /dev/null),)
	# Bash shell
	echo "source $(PWD)/sshmate-completion.bash" >> ~/.bashrc
else
	# Zsh shell
	echo "source $(PWD)/sshmate-completion.bash" >> ~/.zshrc
endif