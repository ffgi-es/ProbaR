task :default do
  FileList['spec/*_probe.rb'].each { |file| ruby "-I lib #{file}" }
end
