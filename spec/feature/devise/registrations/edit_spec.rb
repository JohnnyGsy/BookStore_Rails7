RSpec.describe 'Edit', type: :feature do
  %i[billing shipping].each do |address_type|
    describe address_type do
      let(:address_data) { attributes_for(:address, address_type: address_type) }
      let(:user) { create(:user) }

      before do
        sign_in(user)
        visit edit_user_registration_path
      end

      feature 'with valid input' do
        before do
          within "##{address_type}_address" do
            fill_in(I18n.t('address.first_name'), with: address_data[:first_name])
            fill_in(I18n.t('address.last_name'), with: address_data[:last_name])
            fill_in(I18n.t('address.city'), with: address_data[:city])
            fill_in(I18n.t('address.address'), with: address_data[:address])
            fill_in(I18n.t('address.zip'), with: address_data[:zip])
            page.select(address_data[:country], from: 'address_form_country')
            fill_in(I18n.t('address.phone'), with: address_data[:phone])
            click_button(I18n.t('button.save'))
          end
        end

        scenario 'returns success message' do
          expect(page).to have_content(I18n.t('address.form.success', address_type: address_type))
        end
      end

      feature 'with invalid input' do
        before do
          within "##{address_type}_address" do
            click_button(I18n.t('button.save'))
          end
        end

        scenario 'stays at address page' do
          expect(page).to have_current_path(edit_user_registration_path)
        end
      end
    end
  end

  feature 'with password change' do
    let(:user_data) { attributes_for(:user) }
    let(:user) { create(:user, user_data) }

    before do
      sign_in(user)
      visit edit_user_registration_path
      find('#privacy').click
    end

    feature 'with valid input' do
      before do
        within '#password-form' do
          fill_in(I18n.t('devise.current_password'), with: user_data[:password])
          fill_in(I18n.t('devise.new_password'), with: user_data[:password])
          fill_in(I18n.t('devise.confirm_password'), with: user_data[:password])
          click_button(I18n.t('button.save'))
        end
      end

      scenario 'saves new password' do
        expect(page).to have_content(I18n.t('devise.registrations.updated'))
      end
    end

    feature 'with invalid input' do
      let(:invalid_password) { '1' }

      before do
        within '#password-form' do
          fill_in(I18n.t('devise.current_password'), with: invalid_password)
          fill_in(I18n.t('devise.new_password'), with: invalid_password)
          click_button(I18n.t('button.save'))
        end
      end

      scenario do
        expect(page).to have_content(I18n.t('errors.messages.invalid'))
        expect(page).to have_content(I18n.t('errors.messages.confirmation', attribute: 'Password'))
      end
    end
  end

  feature 'with email change' do
    let(:user_data) { attributes_for(:user) }
    let(:user) { create(:user, user_data) }

    before do
      sign_in(user)
      visit edit_user_registration_path
      find('#privacy').click
    end

    feature 'with valid input' do
      let(:new_email) { Faker::Internet.email }

      before do
        within '#email-form' do
          fill_in(I18n.t('devise.email'), with: new_email)
          click_button(I18n.t('button.save'))
        end
      end

      scenario 'saves new email' do
        expect(page).to have_content(I18n.t('devise.registrations.updated'))
      end
    end

    feature 'with invalid input' do
      let(:invalid_email) { 'dasdasd' }

      scenario 'displays invalid format message' do
        within '#email-form' do
          fill_in(I18n.t('devise.email'), with: invalid_email)
          click_button(I18n.t('button.save'))
        end
        expect(page).to have_content(I18n.t('activerecord.errors.models.user.attributes.email.invalid'))
      end
    end
  end
end
