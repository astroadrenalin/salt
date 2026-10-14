ssh_service:
  service.running:
    - name: ssh
    - enable: true
    - reload: true
    - watch:
        - file: ssh_hardening_config
        - file: ssh_banner
    - require:
      - pkg: required_packages

javad_ssh_key:
    ssh_auth.manage:
        - user: javad
        - ssh_keys:
            - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM72s2s4xBttIds/k5e/FTTiwOAtVjJxOeSE7n1Exd9z javad@Astro-Mac.local
        - config: .ssh/authorized_keys
        - require:
            - user: admin_user

ssh_banner:
    file.managed:
        - name: /etc/issue.net
        - contents: |
            WARNING: Authorized access only.
            All activity will be monitored and logged.
        - user: root
        - group: root
        - mode: '0644'

ssh_hardening_config:
    file.managed:
        - name: /etc/ssh/sshd_config/00-ssh_hardening.conf
        - contents: |
            PasswordAuthentication: no
            PubkeyAuthentication: yes
            Banner: /etc/issue.net
        - user: root
        - group: root
        - mode: '0644'
        - require:
            - file: ssh_banner
