# sshmate

`sshmate` is a tool designed to simplify interactions with SSH servers. It provides an easy way to connect to servers by assigning a name to an address. After adding a connection, you can directly connect to the server using the name you provided. It also allows adding log messages to existing connections. These log messages serve as additional descriptions of the server, making it easier to remember what the server is for and how it's been changed over time. For example, you might add log messages like *upgraded mysql* or *installed nginx using latest version*. Then, when you need to connect to the server again, you can simply search for keywords in the log messages to quickly find the server you need.

`sshmate` also supports symbolic links, which means that `sshmate` can be installed at any path. `sshmate` includes an autocompletion feature that makes it easy to quickly navigate between connction names using the `tab` key.

## Installation

* Clone the repo
* Create a symlink to `sshmate` script
  ```bash
  ln -s {REPO_PATH}/sshmate/sshmate /usr/local/bin/sshmate
  ```
* Install the auto-completion script e.g. `in your ~/.zshrc`:
  ```bash
  source {REPO_PATH}/sshmate-completion.bash
  ```

## Usage
```bash
❯ sshmate -h
Usage:   sshmate -c <NAME>                 (connect to an existing connection)
         sshmate -l                        (list all connections)
         sshmate -n <NAME> -a <ADDRESS>    (add a new connection)
         sshmate -a <NAME> -d <MESSAGE>    (add a log message to an existing
                                           connection)
         sshmate -s <TXT>                  (connection to an existing connection
                                           by a matching text in the log)
         sshmate -r <NAME>                 (remove connection)
Options:
         -c <CONNECTION_NAME>      (connect to an existing connection name)
         -l                        (list all connections)
         -n <CONNECTION_NAME>      (add a new connection name)
         -a <CONNECTION_ADDRESS>   (add a connection address, used with -n)
         -d <MSG>                  (add a log message to an existing connection)
         -r <CONNECTION_NAME>      (remove an existing connection)
         -s <TXT>                  (connect to a machine using an existing
                                    connection by finding match in the logs)
         -h                        (show this message for usage help)

Example: Connect to an existing connection name
         sshmate -c do_linux_centos7

         Create a new connection
         sshmate -n do_linux_centos7 -a root@10.10.10.1

         Create a new connection
         sshmate -a do_linux_centos7 -d "installed mysql latest version"

         Connect to an existing connection by searching for a match in the logs
         sshmate -s mysql
```

## Examples

### Add a new connection
```bash
❯ sshmate -n do_linux_ubuntu16 -a nonroot@10.10.10.2
adding new connection..
Adding [nonroot@10.10.10.2] connection with the name: do_linux_ubuntu16%
```

### List all connections
```bash
❯ sshmate -l
listing all SSH connections...
do_linux_centos7                 ==>  root@10.10.10.1
do_linux_ubuntu16                ==>  nonroot@10.10.10.2
do_linux_rh                      ==>  root@10.10.10.3
```

### Connect to one of the listed/existing connections
```bash
❯ sshmate -c do_linux_centos7
checking connection:do_linux_centos7
connecting to: root@10.10.10.1
ssh root@10.10.10.1
```

### Add/append a log message to an existing connection
```bash
❯ sshmate -a do_linux_centos7 -d "installed mysql with new test db"
adding new connection..
add a description to existing connection
description is:  installed mysql with new test db
got connection:  do_linux_centos7
```

### Use a log message lookup to access an existing connection
```bash
❯ sshmate -s mysql
connecting to: root@10.10.10.1
```
