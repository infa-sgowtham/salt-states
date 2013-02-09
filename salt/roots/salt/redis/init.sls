redis-server:
  apt_repository:
    - ubuntu_ppa
    - user: chris-lea
    - name: redis-server
    - key_id: C7917B12
  pkg:
    - installed
    - require:
      - apt_repository: redis-server
  file.managed:
    - name: /etc/redis.conf
    - source: salt://redis/redis.conf.jinja
    - template: jinja
    - defaults:
        bind: 127.0.0.1
        port: 6379
    - require:
      - pkg: redis-server
  service.running:
    - enable: True
    - watch:
      - file: redis-server
      - pkg: redis-server
