install:
  pkg.installed:
    - pkgs:
      - httpd

deploy files:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://apache/index.html
    - template: jinja

httpd:
  service.running:
    - enable: True
