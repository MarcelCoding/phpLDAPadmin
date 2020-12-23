# phpLDAPadmin

phpLDAPadmin is a web based LDAP data management tool for system administrators. It is commonly known and referred by
many as "PLA".

A primary goal of PLA is to be as intuitive as possible - so it is certainly possible for end users to use it as well,
for example, to manage their data in an LDAP server.

PLA is designed to be compliant with LDAP RFCs, enabling it to be used with any LDAP server. If you come across an LDAP
server, where PLA exhibits problems, please open an issue with full details of the problem so that we can have it fixed.

## History

Initially created in 2002 by David Smith, it was taken over by Deon George (aka leenooks) in 2005.

Since 2003 many things have changed - initial development was done in CVS and the project was hosted on Sourceforge. In
2009, CVS was swapped out for GIT, and in around 2011 the project was moved to Github.

The PLA v1.2.x stream was created in July 2009.

Work on PLA v2 has started and some information on that is below. Soon `master` will be updated and `BRANCH-2.0` will be
visible in git. Until then, a sneak peak of v2 is available [here](https://phpldapadmin.servio.leenooks.net)

---
This is a fork of mine, I added an alpine Docker image and removed insecure password hash algorithms.

## Installation

````yaml
# docker-compose.yaml
version: '3.7'

services:
  ldapadmin:
    image: marcelcoding/phpldapadmin:latest
    restart: always
    environment:
      - 'LDAP_HOST=ldap'
    # - 'LDAP_PORT=389' -> Default Value
      - 'LDAP_BIND_DN="cn=admin,dc=example,dc=com"'
    ports:
      - 8080:80

  ldap:
    image: howardlau1999/openldap-bcrypt:latest
    restart: always
    environment:
      - 'LDAP_ORGANISATION=example.com'
      - 'LDAP_DOMAIN=example.com'
      - 'LDAP_ADMIN_PASSWORD=SECRET_PASSWORD'
    volumes:
      - 'ldap-data:/var/lib/ldap'
      - 'ldap-config:/etc/ldap/slapd.d'

volumes:
  ldap-data:
  ldap-config:
````

## License

[LICENSE](LICENSE)
