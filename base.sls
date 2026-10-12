system_upgrade:
  pkg.uptodate:
    - refresh: true

required_packages:
  pkg.installed:
    - pkgs:
      - curl
      - vim
      - nano
      - htop
      - tmux
      - git
      - wget
      - sudo
      - openssh-server
      - ca-certificates
    - require:
      - pkg: system_upgrade

ssh_service:
  service.running:
    - name: ssh
    - enable: true
    - require:
      - pkg: required_packages

admin_javad:
  user.present:
    - name: salt
    - fullname: saltstack
    - shell: /bin/bash
    - home: /home/salt
    - createhome: true
    - optional_groups:
      - sudo
    - require:
      - pkg: required_packages
  