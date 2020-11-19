# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

    patients = [] # then do patients << info to push into the arrays
    doctors = []
    roles = ['xrays', 'colds', 'disease']

    # create 10 patients push them on users array
    10.times do |i|
      patients << Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    end

    # here we create some doctors and push them into doctors array
    5.times do |i|
      doctors << Doctor.create(name: Faker::Name.last_name)
    end

    # here we go through each doctor and add 2 appointments
    doctors.each do |doctor|
      2.times do
        # Appointment.create(role: roles.sample, patient_id: patients.sample.id, doctor_id:doctor.id) #this works but here's another way
        doctor.appointments.create(role: roles.sample, patient_id: patients.sample.id)
      end
    end
puts 'seeded'