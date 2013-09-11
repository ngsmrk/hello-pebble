require "pebble"

Pebble.logger.level = Logger::DEBUG

# Create your watch using the serial port assigned to your Pebble.
#watch = Pebble::Watch.new("7F30", "/dev/tty.Pebble7F30-SerialPortSe")
# You can also use autodetection if you're on OS X:
watch = Pebble::Watch.autodetect

watch.connect

watch.ping

at_exit do
  puts watch
  watch.disconnect if watch
end
