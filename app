# Mobile Application for platform HireRush.com
# Author: Valentyna Fihurska
# Start of development: 08-Aug-2019


import kivy
from kivy.app import App
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.gridlayout import GridLayout
from kivy.uix.textinput import TextInput
from kivy.uix.pagelayout import PageLayout
from kivy.uix.screenmanager import ScreenManager, Screen
#from kivy.lang import Builder
from kivy.config import Config
from kivy.uix.image import Image
from kivy.graphics import Color, Rectangle
from kivy.graphics.instructions import Canvas
#from kivy.clock import Clock
from kivy.uix.checkbox import CheckBox

#Builder.load_string('''
#<-Button,-ToggleButton>:
#    GridLayout:
#		Button:
#			size_hint_x = 50
#			size_hint_y = 50
#			pos_hint_x = 100
#			pos_hint_y = 100
#''')

kivy.require('1.11.1')

width = '375'
height = '667'
#screens = ScreenManager()

class LoginMainPage(GridLayout):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.canvas = Canvas()
        self.canvas.add(Color(0.168, 0.77, 0.545))
        self.canvas.add(Rectangle(size=(int(width), int(height))))
        self.background = Image(source='hirerush_m.jpg')
        self.add_widget(self.background)
        self.cols=1
        self.rows=4
        self.row_force_default=True
        self.row_default_height=40
        self.padding = [50, 10, 50, 10]
        self.spacing = [5, 5]
        self.add_widget(Label(text='Welcome to App!', font_size=16))
        self.login_button = Button(text='Log in', font_size=12)
        self.signup_button = Button(text='Sign up', font_size=12)
        self.add_widget(self.login_button)
        self.add_widget(self.signup_button)
        self.login_button.bind(on_press=self.login_button_func)
        self.signup_button.bind(on_press=self.signup_button_func)


    def update_info(self, message):
        self.message.text = message

    def login_button_func(self, smth):
    	#MobileApp.login.update_info(self, 'smth')
    	#app=MobileApp()
    	hirerush_app.screens.current = 'Log into your account!'

    def signup_button_func(self, smth):
    	pass



class Login(GridLayout):
	def __init__(self, **kwargs):
		super().__init__(**kwargs)
		self.canvas = Canvas()
		self.canvas.add(Color(0.168, 0.77, 0.545))
		self.canvas.add(Rectangle(size=(int(width), int(height))))
		self.background = Image(source='hirerush_m.jpg')
		self.add_widget(self.background)
		self.cols=1
		self.rows=7
		self.row_force_default=True
		self.row_default_height=40
		self.padding = [50, 10, 50, 10]
		self.spacing = [5, 5]
		self.add_widget(Label(text='Welcome to App!', font_size=16))
		self.add_widget(Label(text='Phone number or email', font_size=14))
		self.number = TextInput(multiline=False)
		self.add_widget(self.number)
		self.add_widget(Label(text='Password', font_size=14))
		self.password = TextInput(multiline=False, password=True)
		self.add_widget(self.password)
		self.store = CheckBox()
		self.add_widget(self.store)








class MobileApp(App):
	def build(self):
		Config.set('graphics', 'width', width)
		Config.set('graphics', 'height', height)
		self.screens = ScreenManager()

		self.login_main_page = LoginMainPage()
		screen = Screen(name='Welcome!')
		screen.add_widget(self.login_main_page)
		self.screens.add_widget(screen)

		self.login = Login()
		screen = Screen(name='Log into your account!')
		screen.add_widget(self.login)
		self.screens.add_widget(screen)

		return self.screens


if __name__ == '__main__':
	hirerush_app = MobileApp()
	hirerush_app.run()

