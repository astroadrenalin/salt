include:
    - base

javad_ssh_key:
    ssh_auth.manage:
        - user: javad
        - ssh_keys:
            - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM72s2s4xBttIds/k5e/FTTiwOAtVjJxOeSE7n1Exd9z javad@Astro-Mac.local
        - config: .ssh/authorized_keys
        - require:
            - user: admin_user

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

