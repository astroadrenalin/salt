include:
    - base

javad_sudoers:
    file.managed:
        - name: /etc/sudoers.d/javad
        - contents: |
            javad ALL=(ALL:ALL) NOPASSWD: ALL
        - user: root
        - group: root
        - mode: '0440'
        - check_cmd: /usr/sbin/visudo -c -f
        - require:
            - user: admin_user
            - pkg: required_packages

