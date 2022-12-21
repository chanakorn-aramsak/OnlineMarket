require "application_system_test_case"

class MyMarketTest < ApplicationSystemTestCase
  setup do
    @market = markets(:one)
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
  end

  test "visiting the index" do
    visit "/my_market"
    assert_selector "h1", text: "My Market Page"
  end

  test "showing table element" do
    visit "/my_market"

    assert_selector 'table' do
        assert_selector 'thead' do
            assert_selector 'tr' do
                assert_selector 'th:nth-child(1)',text: 'Name'
                assert_selector 'th:nth-child(2)',text: 'Category'
                assert_selector 'th:nth-child(3)',text: 'Picture'
                assert_selector 'th:nth-child(4)',text: 'Price'
                assert_selector 'th:nth-child(5)',text: 'Current Stock'
                assert_selector 'th:nth-child(6)',text: 'Buying'
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: 'oneItem'
                assert_selector 'td:nth-child(2)',text: 'one'
                assert_selector 'td:nth-child(3)',text: ''
                assert_selector 'td:nth-child(4)',text: '1.5'
                assert_selector 'td:nth-child(5)',text: '1'
                assert_selector 'td:nth-child(6)' do
                    assert_selector 'input', text: ''
                    assert_selector 'input.btn', text: ''
                end
            end
        end
    end
  end

  test "finding" do
    visit "/my_market"

    fill_in "Search:", with: "one"

    assert_selector 'table' do
        assert_selector 'thead' do
            assert_selector 'tr' do
                assert_selector 'th:nth-child(1)',text: 'Name'
                assert_selector 'th:nth-child(2)',text: 'Category'
                assert_selector 'th:nth-child(3)',text: 'Picture'
                assert_selector 'th:nth-child(4)',text: 'Price'
                assert_selector 'th:nth-child(5)',text: 'Current Stock'
                assert_selector 'th:nth-child(6)',text: 'Buying'
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: 'oneItem'
                assert_selector 'td:nth-child(2)',text: 'one'
                assert_selector 'td:nth-child(3)',text: ''
                assert_selector 'td:nth-child(4)',text: '1.5'
                assert_selector 'td:nth-child(5)',text: '1'
                assert_selector 'td:nth-child(6)' do
                    assert_selector 'input', text: ''
                    assert_selector 'input.btn', text: ''
                end
            end
        end
    end
  end

  test "must_fill_number_of_things" do
    visit "/my_market"
    click_on "BUY"
    assert_selector "p", text: ""           #:required => true will be show message that the field must be filled.
  end

  test "buying product 1" do
    visit "/my_market"

    fill_in "buying", with: 5
    click_on "BUY"

    assert_selector "p", text: "Completly buying ;)"
  end 

  test "buying product 2" do
    visit "/my_market"

    fill_in "buying", with: 100
    click_on "BUY"

    assert_selector "p", text: "คำสั่งซื้อไม่สำเร็จ เนื่องจากจำนวนสินค้าที่คงเหลือไม่พอ"
  end 

end