# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit root_path

    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Javascript'
    fill_in 'メモ', with: 'わかりにくい'
    fill_in '著者', with: 'ellen'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Javascript'
    assert_text 'わかりにくい'
    assert_text 'ellen'

    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: 'Ruby入門'
    fill_in 'メモ', with: 'とてもわかりやすい'
    fill_in '著者', with: 'frank'

    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'Ruby入門'
    assert_text 'とてもわかりやすい'
    assert_text 'frank'

    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
