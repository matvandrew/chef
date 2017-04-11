# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "chefadmin"
client_key               "~/chef/task8/chefadmin.pem"
chef_server_url          "https://vm1.mnt.com/organizations/linox"
cookbook_path            ["~/chef/task8/cookbooks"]
