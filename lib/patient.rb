class Patient
  @@all = []
  attr_accessor :name
  def initialize(name)
    self.name=name
    self.save
  end

  def save
    @@all << self
  end

  def self.all 
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select{|a| a.patient == self}
  end

  def doctors
    self.appointments.collect {|a| a.doctor}
  end


end