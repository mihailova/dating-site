require 'spec_helper'

describe 'Users' do
  context "#show" do

    context 'user logged' do
      let(:current_user) { FactoryGirl.create(:user) }

      before :each do
        login_as(current_user, :scope => :user)
      end

      after(:each) { Warden.test_reset!  }

      context "see its own profile" do
        before { visit user_path(current_user)}

        it 'contain link to edit' do
          within('.edit') do
            expect(page).to have_link "Edit profile", edit_user_path(current_user)
          end
        end

        it 'not contain button to send message' do
          expect(page).not_to have_selector "#send_message"
        end

        it 'contain link to gallery' do
          within('.gallery') do
            expect(page).to have_link "Gallery", gallery_user_path(current_user)
          end
        end
      end

      context "see someone else profile" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user)}

        it 'not contain link to edit' do
          within(".user") do 
            expect(page).not_to have_link "Edit profile", edit_user_path(current_user)
          end
        end

        it 'contain button to add message' do
          within('.send_message') do
            expect(page).to have_selector "#send_message"
          end
        end

        it 'contain link to gallery' do
          within('.gallery') do
            expect(page).to have_link "Gallery", gallery_user_path(user)
          end
        end
      end
    end

    context 'user not logged' do
      let(:user) { FactoryGirl.create(:user) }
      before { visit user_path(user)}

      it "contain User's name" do
        within('.user-data') do
          expect(page).to have_content user.name
        end
      end

      it "contain User's age" do
        within('.user-data') do
          expect(page).to have_content user.age
        end
      end

      it "contain User's gender" do
        within('.user-data') do
          expect(page).to have_content user.gender
        end
      end

      it "contain User's location" do
        within('.user-data') do
          expect(page).to have_content user.location
        end
      end

      it "contain User's search_for" do
        within('.user-data') do
          expect(page).to have_content user.search_for
        end
      end


      it 'not contain button to add message' do
        expect(page).not_to have_selector "#send_message"
      end

      it 'not contain link to gallery' do
        expect(page).not_to have_link "Gallery", gallery_user_path(user)
      end
    end
  end
end