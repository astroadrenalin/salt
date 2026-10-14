admin_user:
  user.present:
    - name: javad
    - fullname: javad hashemi
    - shell: /bin/bash
    - home: /home/javad
    - createhome: true
    - optional_groups:
      - sudo
    - require:
      - pkg: required_packages
  
regular_user:
  user.present:
    - name: amir
    - fullname: amir mohammadi
    - shell: /usr/sbin/nologin
    - home: /home/amir
    - createhome: true