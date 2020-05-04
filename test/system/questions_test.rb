require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test 'visiting /ask renders the form' do
    visit ask_url
    assert_selector 'h1', text: 'Ask your coach anything'
  end

  test 'saying Hello yields a grumpy response from the coach' do
    visit ask_url
    fill_in 'question', with: 'Hello'
    click_on 'Ask'
    take_screenshot
    assert_text "I don't care, get dressed and go to work!"
  end

  test 'saying nothing yields a question response from the coach' do
    visit ask_url
    fill_in 'question', with: ''
    click_on 'Ask'

    assert_text "Sorry i didn't understood you. Please repeat"
  end

  test 'saying i am going to work right now! yields a friendly response from the coach' do
    visit ask_url
    fill_in 'question', with: 'i am going to work right now!'
    click_on 'Ask'

    assert_text 'You better do :)'
  end

  test 'saying HELLO yields a grumpy response from the coach' do
    visit ask_url
    fill_in 'question', with: 'HELLO'
    click_on 'Ask'

    assert_text "I can feel your motivation! I don't care, get dressed and go to work!"
  end

    test 'saying HELLO? yields a question response from the coach' do
    visit ask_url
    fill_in 'question', with: 'HELLO?'
    click_on 'Ask'

    assert_text "I can feel your motivation! Silly question, get dressed and go to work!"
  end
end
