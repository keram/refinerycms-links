# encoding: utf-8
require 'spec_helper'

def new_window_should_have_content(content)
  new_window = page.driver.browser.window_handles.last
  page.within_window new_window do
    page.should have_content(content)
  end
end

def new_window_should_not_have_content(content)
  new_window = page.driver.browser.window_handles.last
  page.within_window new_window do
    page.should_not have_content(content)
  end
end

module Refinery
  module Admin
    describe 'Links' do
      describe 'page link' do
        before do
          Refinery::Testing::FeatureMacros::I18n.stub_frontend_locales :en, :ru

          # Create a page in both locales
          about_page = Globalize.with_locale(:en) do
            Page.create title: 'About'
          end

          Globalize.with_locale(:ru) do
            about_page.title = 'About Ru'
            about_page.save
          end
        end

        after do
          Refinery::Testing::FeatureMacros::I18n.unstub_frontend_locales
        end

        let(:about_page) do
          page = Refinery::Page.last
          # we need page parts so that there's wymeditor
          Refinery::Links.default_parts.each_with_index do |default_page_part, index|
            page.parts.create(title: default_page_part, body: nil, position: index)
          end
          page
        end

        describe 'adding page link' do
          describe 'with relative urls' do
            it "shows Russian pages if we're editing the Russian locale" do
              visit refinery.admin_dialogs_pages_path frontend_locale: :ru
              within '#pages-link-area' do
                page.should have_content('About Ru')
              end
              #page.should have_selector("a[href='/ru/about-ru']")
            end

            it 'shows default to the default locale if no query string is added' do
              visit refinery.admin_dialogs_pages_path

              within '#pages-link-area' do
                page.should have_content('About')
              end
              #page.should have_selector("a[href='/about']")
            end
          end

          describe 'with absolute urls' do
            it "shows Russian pages if we're editing the Russian locale" do
              visit refinery.admin_dialogs_pages_path frontend_locale: :ru

              within '#pages-link-area' do
                page.should have_content('About Ru')
              end
              #page.should have_selector("a[href='http://www.example.com/ru/about-ru']")
            end

            it 'shows default to the default locale if no query string is added' do
              visit refinery.admin_dialogs_pages_path

              within '#pages-link-area' do
                page.should have_content('About')
              end
              #page.should have_selector("a[href='http://www.example.com/about']")
            end
          end
        end

      end
    end
  end
end
