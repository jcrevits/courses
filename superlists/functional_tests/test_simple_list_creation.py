from .base import FunctionalTest

from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class NewVisitorTest(FunctionalTest):

    def test_can_start_a_list_for_one_user(self):
        self.browser.get(self.live_server_url)

        self.assertIn('To-do', self.browser.title)
        header_text = self.browser.find_element_by_tag_name('h1').text
        self.assertIn('to-do', header_text)

        inputbox = self.get_item_input_box()
        self.assertEqual(
            inputbox.get_attribute('placeholder'),
            'Enter a to-do item'
        )

        inputbox.send_keys('Buy a shiny board game')
        inputbox.send_keys(Keys.ENTER)
        self.wait_for_row_in_list_table('1: Buy a shiny board game')

        inputbox = self.get_item_input_box()
        inputbox.send_keys('Play a board game with friends')
        inputbox.send_keys(Keys.ENTER)

        self.wait_for_row_in_list_table('1: Buy a shiny board game')
        self.wait_for_row_in_list_table('2: Play a board game with friends')

    def test_multiple_users_can_start_lists_at_different_urls(self):
        self.browser.get(self.live_server_url)

        inputbox = self.get_item_input_box()
        inputbox.send_keys('Buy a shiny board game')
        inputbox.send_keys(Keys.ENTER)
        self.wait_for_row_in_list_table('1: Buy a shiny board game')

        julien_list_url = self.browser.current_url
        self.assertRegex(julien_list_url, '/lists/.+')

        # new browser session / user
        self.browser.quit()
        self.browser = webdriver.Firefox()

        # checking one_user list is not present
        self.browser.get(self.live_server_url)
        page_text = self.browser.find_element_by_tag_name('body').text
        self.assertNotIn('Buy a shiny board game', page_text)
        self.assertNotIn('game with friends', page_text)

        # new list
        inputbox = self.get_item_input_box()
        inputbox.send_keys('Go scuba diving')
        inputbox.send_keys(Keys.ENTER)
        self.wait_for_row_in_list_table('1: Go scuba diving')

        # user's unique url
        chad_list_url = self.browser.current_url
        self.assertRegex(chad_list_url, '/lists/.+')
        self.assertNotEqual(chad_list_url, julien_list_url)

        # check for one_user list again and new list
        page_text = self.browser.find_element_by_tag_name('body').text
        self.assertNotIn('Buy a shiny board game', page_text)
        self.assertIn('Go scuba diving', page_text)
