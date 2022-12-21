require "application_system_test_case"

class Top_Seller_Test < ApplicationSystemTestCase
  setup do
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
    visit "/top_seller"
    assert_selector "h1", text: "Top Seller"
  end

  test "specify date caseOK" do
    visit "/top_seller"
    fill_in "start_date", with: "05/12/2022"
    fill_in "end_date", with: "07/12/2022"
    click_on "search"

    assert_selector "h3", text: "Top seller sorted by 'Sold amount' between 2022-12-05 and 2022-12-07"
    assert_selector "h3", text: "Top seller sorted by 'The highest total sales' between 2022-12-05 and 2022-12-07"
  end

  test "specify date caseERROR" do
    visit "/top_seller"
    fill_in "start_date", with: "07/12/2022"
    fill_in "end_date", with: "05/12/2022"
    click_on "search"

    assert_selector "p", text: 'วันเริ่มต้นต้อง "น้อยกว่า" วันสิ้นสุด'
  end

  test "check sorted" do
    visit "/top_seller"
    fill_in "start_date", with: "05/12/2022"
    fill_in "end_date", with: "20/12/2022"
    click_on "search"

    assert_selector 'table#top1' do
        assert_selector 'thead' do
            assert_selector 'tr' do
                assert_selector 'th:nth-child(1)',text: 'Seller ID'
                assert_selector 'th:nth-child(2)',text: 'Seller Name'
                assert_selector 'th:nth-child(3)',text: 'Seller Email'
                assert_selector 'th:nth-child(4)',text: 'Sold amount'
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: '991613951'
                assert_selector 'td:nth-child(2)',text: '111'
                assert_selector 'td:nth-child(3)',text: '1@gmail.com'
                assert_selector 'td:nth-child(4)',text: '8'
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: '135138680'
                assert_selector 'td:nth-child(2)',text: '001'
                assert_selector 'td:nth-child(3)',text: '0@gmail.com'
                assert_selector 'td:nth-child(4)',text: '3'
            end
        end
    end

    assert_selector 'table#top2' do
        assert_selector 'thead' do
            assert_selector 'tr' do
                assert_selector 'th:nth-child(1)',text: 'Seller ID'
                assert_selector 'th:nth-child(2)',text: 'Seller Name'
                assert_selector 'th:nth-child(3)',text: 'Seller Email'
                assert_selector 'th:nth-child(4)',text: 'Total sales'
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: '135138680'
                assert_selector 'td:nth-child(2)',text: '001'
                assert_selector 'td:nth-child(3)',text: '0@gmail.com'
                assert_selector 'td:nth-child(4)',text: '300'
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: '991613951'
                assert_selector 'td:nth-child(2)',text: '111'
                assert_selector 'td:nth-child(3)',text: '1@gmail.com'
                assert_selector 'td:nth-child(4)',text: '12'
            end
        end
    end

    
  end
  
end