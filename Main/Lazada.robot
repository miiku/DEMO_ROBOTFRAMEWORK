*** Settings ***
Library    Selenium2Library
#Test Teardown    Close Browser


*** Testcases ***
Search product by keyword
    Open first page
    Fill in iphone6s
    Search product
    I will see result of iphone6s
    Click product

See product detail
    [Tags]   dev
    Open first page
    Fill in iphone6s
    Search product
    I will see result of iphone6s
    Click product
    Add to cart
    Payment

Checkout process
    Open Browser   http://www.lazada.co.th/apple-iphone-6s-128gb-47-rose-gold-2154232.html  gc
    Maximize Browser Window



*** Keywords ***
Payment
    Wait Until Element Is Visible    xpath=//div/div[2]/div/div[3]/div/a/span
    Click Element    xpath=//div/div[2]/div/div[3]/div/a/span

Add to cart
    Wait Until Element Is Visible    xpath=//div[3]/div[2]/div/div[2]/div/div[3]/span
    Click Element    xpath=//div[3]/div[2]/div/div[2]/div/div[3]/span
    Click Button    AddToCart


Click product
    Wait Until Page Contains Element    xpath=//div[@class='catalog__main__content']/div[2]/div[2]/a/div[3]/div[1]/span
    Click Element    xpath=//div[@class='catalog__main__content']/div[2]/div[2]/a/div[3]/div[1]/span

Open first page
    Open Browser    https://www.lazada.co.th/  gc
    Maximize Browser Window

Fill in iphone6s
    Input Text    searchInput    iphone6s

Search product
    Click Element    xpath=//*[@id="search"]/div

I will see result of iphone6s
    Title Should Be    iPhone 6s ซื้อไอโฟน 6s พลัส ราคาดีที่สุด I Lazada.co.th
    Wait Until Page Contains Element    xpath=//div/h1[@class='catalog__title']
    Wait Until Element Contains    xpath=//div/h1[@class='catalog__title']    iPhone 6s
