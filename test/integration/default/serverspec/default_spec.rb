require 'serverspec'
set :backend, :exec


if node.role?('apache_web_server')
  web_type = 'httpd'
elsif node.role?('nginx_web_server')
  web_type = 'nginx'
end

describe "package is installed" do
	it "#{web_type} are installed" do
		expect(package("#{web_type}")).to be_installed
	end
end

describe "service are running" do
	it "#{web_type} are running" do
		expect(service("#{web_type}")).to be_running
	end
end

describe "port are listened" do
	it "port are listened" do
		expect(port(80)).to be_listening
	end
end

require 'net/http'
describe 'Build art check' do
  it 'Webapp response is 200' do
     url = URI("http://127.0.0.1/")
     status_response = Net::HTTP.get_response(url)
     expect status_response.kind_of? Net::HTTPSuccess
  end
end
