task :install do
  sh 'mkdir -p .gs & gs bundle install --system'
end

task :test, :file_name do |t, args|
  file_name = args[:file_name] || '*'

  sh "gs cutest -r ./test/#{file_name}_test.rb"
end
