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

add_admin_user:
  