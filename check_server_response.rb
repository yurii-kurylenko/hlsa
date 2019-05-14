require 'benchmark';
require 'net/http';

puts "Press [CTRL+C] to stop"
sleep 1
url = ARGV[0] || 'http://localhost:8080'
requests_count = 0
error_requests = 0

until false
  uri = URI(url)
  response = nil
  begin
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri
      response = Net::HTTP.get_response(uri)
    end
  rescue => exception
    error_requests += 1
  end
  requests_count += 1;
  error_requests += 1 if response && response.code != '200'

  puts "Total requests: #{requests_count}, Error requestst: #{error_requests}, Error rate: #{(error_requests/requests_count) * 100}%"
end

