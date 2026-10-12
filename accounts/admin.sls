javad_ssh_key:
    ssh_auth.manage:
        - user: javad
        - source: salt://ssh_keys/javad.pub
        - config: .ssh/authorized_keys
        - require:
            - user: javad

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

