module RegistrationsHelper

  def spot_status(event)
    if event.sold_out?
      "SOLD OUT"
    else
      link_to "Register!",  new_event_registration_path(event)
    end
  end  

end
