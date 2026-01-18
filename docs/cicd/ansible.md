# Ansible

## Terms

- Ansible works by connecting to the remote machine by SSH. Then it execute the tasks defined in the playbook, which are YAML files containing list of tasks to be performed

- **Control Node**: A control node is a system where Ansible is installed and set up to connect to your server.
- **Managed Nodes**: The systems you control using Ansible are called managed nodes. Ansible requires that managed nodes are reachable via SSH, and have Python 2 (version 2.6 or higher) or Python 3 (version 3.5 or higher) installed.
- **Group**: Several hosts group together.
- **Inventory**: An inventory file contains a list of the hosts you’ll manage using Ansible.
- **Modules**: Unit of code that Ansible send to the remote nodes for execution, such as installing software, managing files, or executing commands.
- **Tasks**: A task is an individual unit of work to execute on a managed node. Each action to perform is defined as a task. Tasks can be executed as a one-off action via ad-hoc commands, or included in a playbook as part of an automation script.
- **Playbooks**: A playbook contains an ordered list of tasks, and a few other directives to indicate which hosts are the target of that automation, whether or not to use a privilege escalation system to run those tasks, and optional sections to define variables or include files.
- **Handlers**: Handlers are used to perform actions on a service, such as restarting or stopping a service that is actively running on the managed node’s system. Handlers are typically triggered by tasks, and their execution happens at the end of a play, after all tasks are finished. 
- **Roles**: A role is a set of playbooks and related files organized into a predefined structure that is known by Ansible. Roles facilitate reusing and repurposing playbooks into shareable packages of granular automation for specific goals, such as installing a web server, installing a PHP environment, or setting up a MySQL server.
## Setup test environment with DigitalOcean

- Use local machine as control node and DigitalOcean droplets as remote hosts.
- Refer [DigitalOcean](cloud/digitalocean.md) to provision droplets.

## Command

### Adhoc command
```
# Test connection to the ansible hosts
ansible all -i hosts -m ping
ansible app -i hosts -m ping

# Format
ansible target -i inventory -mmodule -a "module options"

# Run bash
ansible all -i hosts -a "uptime"
ansible server1 -i inventory -a "tail /var/log/nginx/error.log" --become 

# Install and removing package
ansible all -i hosts -m apt -a "name=nginx" --become
ansible all -i hosts -m apt -a "name=nginx state=absent" --become

# Restart service
ansible webservers -i inventory -m service -a "name=nginx state=restarted" --become -K

# Copy file
ansible all -i hosts -m copy -a "src=./fileA dest=~/fileA"

# Gather info about host
ansible host1 -i hosts -m setup -a "filter=*ipv*"
```

### Playbook command
```
# Executing playbook
ansible-playbook -i hosts playbook.yml -vvv

# Listing playbook task
ansible-playbook -i hosts playbook.yml --list-tasks

# List/Executing/Skipping by tags
ansible-playbook -i hosts playbook.yml --list-tags
ansible-playbook -i hosts playbook.yml --tags=setup
ansible-playbook -i hosts playbook.yml --exclude-tags=setup

# Starting executing at specific task
ansible-playbook -i hosts playbook.yml --start-at-task=Copy index page

# Limit targets
ansible-playbook -l dev -i hosts playbook.yml
```

### Adhoc Command
```
# Copy without hosts file
ansible all -i 'node_ip,' -m copy -a "src=source_directory dest=destination_directory"

# To excute with root user
ansible bothservers -m yum -a "name=tree state=present" --become --become-user root

ansible all -i inventory -a "uptime"
ansible server1 -i inventory -a "tail /var/log/nginx/error.log" --become

# Install packages
ansible all -i inventory -m apt -a "name=nginx" --become -K

# Remove packages
ansible all -i inventory -m apt -a "name=nginx state=absent" --become -K

# Copy files
ansible all -i inventory -m copy -a "src=./file.txt dest=~/myfile.txt"
ansible all -i inventory -m copy -a "src=~/myfile.txt remote_src=yes dest=./file.txt"

# Changing file permissions
ansible all -i inventory -m file -a "dest=/var/www/file.txt mode=600 owner=sammy group=sammy" --become -K

# Restarting services
ansible webservers -i inventory -m service -a "name=nginx state=restarted" --become -K
```

## Files

### Sample `hosts` file
```
sudo vi /etc/ansible/hosts
[app]
host1 ansible_host=159.203.163.103 ansible_user=root ansible_port=22 ansible_ssh_private_key_file=/Users/kim/.ssh/digital_ocean

[sample]
server1 ansible_host=203.0.113.111
server2 ansible_host=203.0.113.112
server3 ansible_host=203.0.113.113

[sample:vars]
ansible_user=sammy
ansible_port=22
ansible_ssh_private_key_file=/home/sammy/.ssh/custom_id
```

### Check
```
# Check inventory
ansible-inventory --list -y

# Check connection
ansible all -m ping -u root

# Adhoc command
ansible all -a "df -h" -u root
```

### Sample `playbook.yml`
Playbook to install nginx and vim
```
---
- hosts: all
  become: true
  tasks:
    - name: Install Packages
      apt: name={{ item }} update_cache=yes state=latest
      loop: [ 'nginx', 'vim' ]
      tags: [ 'setup' ]

    - name: Copy index page
      copy:
        src: index.html
        dest: /var/www/html/index.html
        owner: www-data
        group: www-data
        mode: '0644'
      tags: [ 'update', 'sync' ]
```

Playbook to install nginx, configure and restart
```
---
- name: Nginx installation and configuration
  hosts: web_servers
  become: true

  vars:
    nginx_conf_path: /etc/nginx/nginx.conf
    local_nginx_conf: ./nginx.conf

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: latest
    
    - name: Upload nginx conf
      copy:
        src: "{{ local_nginx_conf }}"
        dest: "{{ nginx_conf_path }}"
        owner: root
        group: root
        mode: '0644'
      notify: restart_nginx
    
    handlers:
      - name: Restart nginx
        service:
          name: nginx
          state: restarted
```

Playbook to install docker
```
---
- hosts: all
  become: true
  vars:
    container_count: 4
    default_container_name: docker
    default_container_image: ubuntu
    default_container_command: sleep 1d

  tasks:
    - name: Install aptitude
      apt:
        name: aptitude
        state: latest
        update_cache: true

    - name: Install required system packages
      apt:
        pkg:
          - apt-transport-https
          - ca-certificates
          - curl
          - software-properties-common
          - python3-pip
          - virtualenv
          - python3-setuptools
        state: latest
        update_cache: true

    - name: Add Docker GPG apt Key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Add Docker Repository
      apt_repository:
        repo: deb https://download.docker.com/linux/ubuntu jammy stable
        state: present

    - name: Update apt and install docker-ce
      apt:
        name: docker-ce
        state: latest
        update_cache: true

    - name: Install Docker Module for Python
      pip:
        name: docker

    - name: Pull default Docker image
      community.docker.docker_image:
        name: "{{ default_container_image }}"
        source: pull

    - name: Create default containers
      community.docker.docker_container:
        name: "{{ default_container_name }}{{ item }}"
        image: "{{ default_container_image }}"
        command: "{{ default_container_command }}"
        state: present
      with_sequence: count={{ container_count }}
```

Playbook to initialize server
```
---
- hosts: all
  become: true
  vars:
    created_username: sammy

  tasks:
    - name: Install aptitude
      apt:
        name: aptitude
        state: latest
        update_cache: true

    - name: Setup passwordless sudo
      lineinfile:
        path: /etc/sudoers
        state: present
        regexp: '^%sudo'
        line: '%sudo ALL=(ALL) NOPASSWD: ALL'
        validate: '/usr/sbin/visudo -cf %s'

    - name: Create a new regular user with sudo privileges
      user:
        name: "{{ created_username }}"
        state: present
        groups: sudo
        append: true
        create_home: true

    - name: Set authorized key for remote user
      ansible.posix.authorized_key:
        user: "{{ created_username }}"
        state: present
        key: "{{ lookup('file', lookup('env','HOME') + '/.ssh/id_rsa.pub') }}"

    - name: Disable password authentication for root
      lineinfile:
        path: /etc/ssh/sshd_config
        state: present
        regexp: '^#?PermitRootLogin'
        line: 'PermitRootLogin prohibit-password'

    - name: Update apt and install required system packages
      apt:
        pkg:
          - curl
          - vim
          - git
          - ufw
        state: latest
        update_cache: true

    - name: UFW - Allow SSH connections
      community.general.ufw:
        rule: allow
        name: OpenSSH

    - name: UFW - Enable and deny by default
      community.general.ufw:
        state: enabled
        default: deny
```
Playbook to setup Apache and restart server
```
- hosts: all
  become: true
  
  tasks:
    - name: Install Apache
      apt: name=Apache
    
  handlers:
    - name: Reload Apache
      service:
        name: apache2
        state: reloaded
  
    - name: Restart Apache
      service:
        name: apache2
        state: restarted
```


### Roles

Tutorial 1: [How to Use Ansible Roles to Abstract your Infrastructure Environment](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-roles-to-abstract-your-infrastructure-environment)

Tutorial 2: [Ansible Roles: Basics, Creating & Using](https://spacelift.io/blog/ansible-roles)

Example:
```
- hosts: all
  become: true
  roles:
    - role: webserver
      vars:
        nginx_version: 1.17.10-0ubuntu1
      tags: example_tag
```