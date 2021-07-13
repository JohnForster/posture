require "terminal-notifier"

MAX_INTERVAL_SECONDS = 25 * 60 # 25 minutes
MIN_INTERVAL_SECONDS = 17 * 60 # 17 minutes

def get_random_interval(min, max)
  difference = max - min
  min + rand() * difference
end

def posture_reminder
  TerminalNotifier.notify("How is your posture?")
end

thread = Thread.new do
  loop do
    posture_reminder()
    time_until_next_notification = get_random_interval(MIN_INTERVAL_SECONDS, MAX_INTERVAL_SECONDS)
    sleep time_until_next_notification
  end
end

thread.join
