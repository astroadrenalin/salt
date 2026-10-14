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