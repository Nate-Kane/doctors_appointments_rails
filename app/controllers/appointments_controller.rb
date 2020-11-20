class AppointmentsController < ApplicationController
  def index
    @doctor = Doctor.find(params[:doctor_id])
    @xrays = @doctor.appointments.where(role: 'xrays')
    @colds = @doctor.appointments.where(role: 'colds')
    @diseases = @doctor.appointments.where(role: 'disease')
      # here we're giving the Appointments controller access to all of the doctor info, patient info, and specialties.
  end

  def new
    @doctor = Doctor.find(params[:doctor_id]) # you have to do :doctor_id instead of just :id... dunno why but that's what the routes say
    @patients = Patient.all - @doctor.patients # this is to subtract patients that already have appts so we can get appts for the others
    @appointment = Appointment.new
    # a problem I found is that while making appointments for a single doctor I can subtract the patients from who's already scheduled, but
      # if I go to a new doctor then it resets? How do I fix this? maybe I can - @Doctor.all.patients??? instead of @doctor.patients. NO this doesn;t work. Let's figure it out.
    
      # what if I make an array that, everytime you create an appointment it pushes that patient into an array which I would subtract from my @patients method? Then with the
        # delete method I could make a way to pop or delete that patient from the array?
         def list_patients 
          @patients.collect{ |p| [p.full_name, p.id]} 
        end 
  end

  def create
    # binding.pry  for testing
    @doctor = Doctor.find(params[:doctor_id])
    @doctor.appointments.create(appointments_params) # go define this. don't forget
      if @doctor.save
        redirect_to doctor_appointments_path(@doctor) 
        # if it saves it'll go to doctors/appointments (I think) and show that doctors appoitments, including the one you just created
      else
        render :new
      end
  end

  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @doctor.appointments.find(params[:id]).destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private

  def appointments_params
    params.require(:appointment).permit(:patient_id, :role)
  end
end

# let's make that array here
# booked_patients = []

# what if I can make a method that will do a loop to search for all doctors that exist, and if Doctor.find(a number in the loop) == nil it'll move on until it finds
# doctors that DO exist. If they exist then it'll