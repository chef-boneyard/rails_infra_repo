name "ops_master"
description "Operations master for the infrastructure."

recipes %w{
  chef::server
  rsyslog::server
  openldap::auth
  openldap::server
}

default_attributes(
  "chef" => { "server_ssl_req" => "/C=US/ST=Several/L=Locality/O=EC2/OU=Operations/CN=chef.example.com/emailAddress=ops@example.com" },
  "apache2" => { "listen_ports" => [ "80", "443" ] },
  "rsyslog" => { "server" => true },
  "openldap" => {
    "server" => "ldap.example.com",
    "basedn" => "dc=example,dc=com",
    "rootpw" => "PASSWORD_HASH",
    "slapd_type" => "master"
  }
)
