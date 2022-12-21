require "application_system_test_case"

class Sale_historyTest < ApplicationSystemTestCase
  setup do
    @market = markets(:one)
    @myrole = 'seller'
    @email = '1@gmail.com'
    @password = "1"
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
  end

  test "visiting the index" do
    visit "/sale_history"
    assert_selector "h1", text: "Sale History"
  end

  test "showing table element" do
    visit "/sale_history"

    assert_selector 'table' do
        assert_selector 'thead' do
            assert_selector 'tr' do
                assert_selector 'th:nth-child(1)',text: 'Product Name'
                assert_selector 'th:nth-child(2)',text: 'Product Category'
                assert_selector 'th:nth-child(3)',text: 'Price'
                assert_selector 'th:nth-child(4)',text: 'Quantity'
                assert_selector 'th:nth-child(5)',text: 'Total Price'
                assert_selector 'th:nth-child(6)',text: "Buyer's name"
                assert_selector 'th:nth-child(7)',text: "Time"
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: 'oneItem'
                assert_selector 'td:nth-child(2)',text: 'one'
                assert_selector 'td:nth-child(3)',text: '1.5'
                assert_selector 'td:nth-child(4)',text: '5'
                assert_selector 'td:nth-child(5)',text: '7.5'
                assert_selector 'td:nth-child(6)',text: "222"
            end
        end
    end
  end

end