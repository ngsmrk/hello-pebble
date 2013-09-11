require "pebble"

Pebble.logger.level = Logger::DEBUG

watch = Pebble::Watch.autodetect


watch.protocol.on_receive do |message|
  puts message
end

watch.on_event(:log) do |event|
    puts "Log event: #{event}"
end

watch.on_event(:system_message) do |event|
  puts "System message event: #{event}"
end

watch.on_event(:app_message) do |event|
  puts "App message event: #{event}"
end

watch.on_event(:media_control) do |event|
  case event.button
    when :playpause
      puts "Play or pause music"
    when :next
      puts "Next track"
    when :previous
      puts "Previous track"
  end
end

watch.connect

watch.listen_for_events

at_exit do
  watch.disconnect if watch
end
