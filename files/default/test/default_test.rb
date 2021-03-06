require 'minitest/spec'

def service_is_listening( port, service )
  assert system "sudo netstat -lp --numeric-ports | grep \":#{port}.*LISTEN.*#{service}\""
end

def web_check_match( url, check )
  assert system "wget -q -O - #{url} | grep '#{check}'"
end

describe_recipe 'jenkins-as-code::default' do

  it "listens for http on tcp port 8080" do
    service_is_listening("8080", "httpd")
  end

  #it 'must match the web check Apache' do
  #  web_check_match("http://127.0.0.1/", "Apache")
  #end

end
