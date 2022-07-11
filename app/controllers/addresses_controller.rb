class AddressesController < ApplicationController
  def update
    address_form = AddressForm.new(address_params)
    authorize address_form, policy_class: AddressPolicy
    if address_form.save
      flash[:success] = t('address.form.success', address_type: address_params[:address_type])
    else
      flash[:danger] = address_form.errors.full_messages.to_sentence
    end
    redirect_to edit_user_registration_path
  end

  def address_params
    params.require(:address_form).permit(:first_name, :last_name, :country, :city, :address, :zip, :phone,
                                         :address_type).merge(user: current_user)
  end
end
