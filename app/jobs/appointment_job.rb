class AppointmentJob < ActiveJob::Base
  queue_as :default

  def perform(*args)

    sleep 10
    puts "Appointment Job created ================================= #{Time.now.strftime('%F - %H:%M:%S.%L')}"
  end
end