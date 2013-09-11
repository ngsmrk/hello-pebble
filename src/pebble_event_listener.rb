require "pebble"

Pebble.logger.level = Logger::DEBUG

watch = Pebble::Watch.autodetect


watch.protocol.on_receive do |message|
  puts message
end

watch.connect

watch.listen_for_events

at_exit do
  watch.disconnect if watch
end
