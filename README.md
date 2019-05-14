Repository consists of:
  1) docker-compose.yml - file with description of attacker container (slowloris realization in python) and web server (victim) configured to prevent DDOS attacks
  2) index.html - replacement of the default (needed for proper configuration in nginx.conf)
  3) nginx.conf - nginx config with protection configurations:
   According to https://www.nginx.com/blog/mitigating-ddos-attacks-with-nginx-and-nginx-plus/, added
   - client_body_timeout and client_header_timeout to close inactive connections in 5 s;
   - limit_conn to reduce number of concurrent connections from 1 address to 10;
  4) Small Ruby script to measure error rates limit
    Example: "ruby check_server.rb http://localhost:8080"
  5) slowloris.py - realization of slowloris attack in Python from https://github.com/gkbrk/slowloris
