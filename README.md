# subversion-ldap
This is the automated docker image generation for svn with LDAP support

## Example docker start:
```bash
docker run -d -p 80:80 -v --name=svn --restart=always -v /path/to/svn/repositories:/repositories --env SVN_LDAP_URL="ldaps://ipa01.example.com:636/" --env SVN_LDAP_BIND_DN="DistinguishedName" --env SVN_LDAP_BIND_PW="Password" --env SVN_LDAP_ALLOWED_GROUP_DN="cn=Administrators" ghcr.io/totemarts/subversion-ldap
```

## Example docker-compose
```yaml
version: "3.8"
services:
  svn:
    image: ghcr.io/totemarts/subversion-ldap
    ports:
      - 80:80
    environment:
      SVN_LDAP_URL: "ldaps://ipa01.example.com:636/"
      SVN_LDAP_BIND_DN: "DistinguishedName"
      SVN_LDAP_BIND_PW: "Password"
      SVN_LDAP_ALLOWED_GROUP_DN: "cn=Administrators"
    volumes:
      - /path/to/svn/repositories:/repositories
```
