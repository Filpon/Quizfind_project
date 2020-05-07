import webdriver
import strutils
import tables
import re
from sequtils import zip

when isMainModule:
    # Заходим на сайт
    let web_driver_task = newWebDriver()
    let session = web_driver_task.createSession()
    let quiz_site_url = "https://findquiz.ru"
    session.navigate(quiz_site_url)
    
    let key = @["adress"]
    var dates: seq[string] = @[]
    var common_info: seq[string] = @[]
    var headers: seq[string] = @[]
    echo(key)

    # Ищем название квиза
    let list_of_headers = session.findElements("div.info > h2")
    for element_header in list_of_headers:  # headers.add
        headers.add(re.findAll(element_header.getText().replace("\n", " ").replace(r"\", " "), re"^.*$")[0])
        #page-wrap > div.content > div:nth-child(7) > div > div > div > ul > li:nth-child(286) > div.info > h2
    echo(headers)
    
    # Ищем даты событий
    let list_of_elements = session.findElements("#event-list")
    for element in list_of_elements:
        dates.add((element.getText()).replace("\n", " "))
    echo(dates)
     # echo(super)
    
    # Ищем основную информаицю по квизу
    let list_of_elements_information = session.findElements(".info-text")
    for element_information in list_of_elements_information:
        common_info.add(element_information.getText().replace("\n", " "))
    echo(common_info)

    session.close()
    
    # var table_super = initTable[string, seq[string]]()
    # table_super["key"] = @[]
    # table_super["key"].add("Test")
    # table_super["key"].add("Testing")
    # var list_of_tables = @[]
    # let super = zip("sda", "asdadf")
    # list_of_tables.add(zip("S", "1"))
    # echo(.getText())  #.get().getText()
    # echo(list_of_elements_price)
    #page-wrap > div.content > div:nth-child(5) > div > div > div > ul > li:nth-child(2) > div.info > p:nth-child(5) > span.info-text
    