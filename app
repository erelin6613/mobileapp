#!/usr/bin/env python3
# Mobile Application for platform HireRush.com
# Author: Valentyna Fihurska
# Start of development: 08-Aug-2019


# Update from 15-Aug-2019
# Created the basic layout for an app along with
# basic styles (see mobile.kv)
# ToDo list:
# 1. Setting up layout for different roles of users
# 2. Connection to HireRush database of users and 
# creating logging/signing up pipelines through an app 

import kivy
from kivy.app import App
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.gridlayout import GridLayout
from kivy.uix.anchorlayout import AnchorLayout
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.textinput import TextInput
from kivy.uix.pagelayout import PageLayout
from kivy.uix.screenmanager import ScreenManager, Screen
#from kivy.lang import Builder
from kivy.config import Config
from kivy.uix.image import Image
from kivy.graphics import Color, Rectangle
from kivy.graphics.instructions import Canvas
from kivy.clock import Clock
from kivy.uix.checkbox import CheckBox
from kivy.uix.widget import Widget
from kivy.uix.rst import RstDocument
import webbrowser

kivy.require('1.11.1')

width = '375'
height = '667'
cols = 1
rows=14
#screens = ScreenManager()

class MainPage(Widget):

    def login_button_func(self):
    	#MobileApp.login.update_info(self, 'smth')
    	#app=MobileApp()
    	Clock.schedule_once(self.connect, 1)
    	hirerush_app.screens.current = 'Log into your account!'

    def signup_pro_func(self):
    	Clock.schedule_once(self.connect, 1)
    	hirerush_app.screens.current = 'Promote your business with HireRush!'


    def signup_customer_func(self):
    	Clock.schedule_once(self.connect, 1)
    	hirerush_app.screens.current = 'Find the right professional for your project'

    def connect(self, smth):
    	pass



class Login(Widget):

	def login_button_func(self):
		pass


	def cancel_button_func(self):
		#Clock.schedule_once(self.connect, 1)
		#self.screens.transition.direction = 'right'
		hirerush_app.screens.current = 'Welcome!'


class Signup_pro(Widget):

	def cancel_button_func(self):
		#Clock.schedule_once(self.connect, 1)
		#self.screens.transition.direction = 'right'
		hirerush_app.screens.current = 'Welcome!'


class Signup_customer(Widget):
	def __init__(self, **kwargs):
		super().__init__(**kwargs)
		self.canvas = Canvas()
		self.canvas.add(Color(0.168, 0.77, 0.545))
		self.canvas.add(Rectangle(size=(int(width), int(height))))
		self.background = Image(source='hirerush_m.jpg')
		self.add_widget(self.background)
		self.cols=cols
		self.rows=rows
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



		self.footer_box = AnchorLayout(anchor_x='center', anchor_y='bottom')
		self.cancel_button = Button(text='Cancel', font_size=12)
		#bubble.background_color = ()
		self.cancel_button.background_color = (0, 0, 0, 0)
		self.footer_box.add_widget(self.cancel_button)
		self.add_widget(self.footer_box)
		self.cancel_button.bind(on_press=self.cancel_button_func)


	def cancel_button_func(self, smth):
		#Clock.schedule_once(self.connect, 1)
		hirerush_app.screens.current = 'Welcome!'







class MobileApp(App):
	def build(self):
		Config.set('graphics', 'width', width)
		Config.set('graphics', 'height', height)
		self.screens = ScreenManager()

		self.login_main_page = MainPage()
		screen = Screen(name='Welcome!')
		screen.add_widget(self.login_main_page)
		self.screens.add_widget(screen)

		self.login = Login()
		screen = Screen(name='Log into your account!')
		screen.add_widget(self.login)
		self.screens.add_widget(screen)

		self.signup_pro = Signup_pro()
		screen = Screen(name='Promote your business with HireRush!')
		screen.add_widget(self.signup_pro)
		self.screens.add_widget(screen)

		self.signup_customer = Signup_customer()
		screen = Screen(name='Find the right professional for your project')
		screen.add_widget(self.signup_customer)
		self.screens.add_widget(screen)


		#Signup_customer

		return self.screens


if __name__ == '__main__':
	hirerush_app = MobileApp()
	hirerush_app.run()

