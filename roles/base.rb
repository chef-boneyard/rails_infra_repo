name "base"
description "Base role is applied to all servers."

recipes %w{
    runit
    ruby
    perl
    zsh
    man
    sudo
    openssh
    postfix
    build-essential
    openldap::auth
    rsyslog::client
    chef::client
}

default_attributes(
  "chef" => { "server_fqdn" => "chef.example.com" },
  "authorization" => { "sudo" => { "groups" => [ "sysadmin" ] } },
  "rsyslog" => { "server" => false },
  "openldap" => {
    "server" => "ldap.example.com",
    "basedn" => "dc=example,dc=com"
  }
)
