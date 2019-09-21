#!/usr/bin/env python3
# Mobile Application for platform HireRush.com
# Author: Valentyna Fihurska
# Start of development: 08-Aug-2019


# Update from 21-Sep-2019
# Created the basic layout for an app along with
# basic styles (see mobile.kv)
# ToDo list:
# 1. Setting up layout for different roles of users
# 2. Connection to HireRush database of users and 
# creating logging/signing up pipelines through an app
# For the time being nobody who would be interested to build
# strong backend but me the job is mostly centered around
# layout and basic 'skeleton' of the app

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
from kivy.graphics.instructions import Canvas
from kivy.graphics import Rectangle, Color
#from kivy.lang import Builder
from kivy.config import Config
from kivy.uix.image import Image
from kivy.graphics import Color, Rectangle
from kivy.graphics.instructions import Canvas
from kivy.clock import Clock
from kivy.uix.checkbox import CheckBox
from kivy.uix.widget import Widget
from kivy.uix.rst import RstDocument
#from kivy.uix.dropdown import DropDown
import webbrowser
from kivy.utils import rgba
from time import sleep

kivy.require('1.11.1')

"""categories = {
				'Teaching & Caring': ['service-teaching-caring', {'Babysitting': 'babysitters',
																	'Beauty Schools': 'beauty-schools', 
																	'Caregiver': 'caregiver', 
																	'Chinese Lessons': 'chinese-lessons',
																	'Cooking Lessons': 'cooking-lessons', 
																	'Dancing Lessons': 'dancing-lessons', 
																	'Daycare': 'daycare',
																	'Drawing Classes': 'drawing-lessons', 
																	'English Lessons': 'english-lessons', 
																	'French Lessons': 'french-lessons', 
																	'Horseback Riding': 'horseback-riding',
																	'Italian Lessons': 'italian-lessons', 
																	'Japanese Lessons': 'japanese-lessons', 
																	'Language Classes': 'classes',
																	'MakeUp Lessons': 'makeup-lessons', 
																	'Martial Arts': 'martial-arts', 
																	'Music Lessons': 'music-lessons',
																	'Other Classes': 'other-classes', 
																	'Photography Classes': 'photography-classes',
																	'Piano Lessons': 'piano-lessons', 
																	'Portuguese Lessons': 'portuguese-lessons',
																	'Private Tutoring': 'private-tutor', 
																	'Russian Lessons': 'russian-lessons',
																	'Singing Lessons': 'singing-lessons', 
																	'Spanish Lessons': 'spanish-lessons',
																	'Sport Lessons': 'sport-lessons', 
																	'Surfing lessons': 'surfing-lessons',
																	'Swim lessons': 'swim-lessons', 
																	'Tennis lessons': 'tenis-lessons'}],

				'Professional Services': ['service-office-services', {'Academic Writing': 'academic-writing',
																		'Bankruptcy Lawyers': 'bankruptcy-lawyers', 
																		'Business Lawyers': 'business-lawyers',
																		'Civil Rights Lawyers': 'civil-rights-lawyers', 
																		'Copywriting': 'copywriting',
																		'Criminal Defense Attorneys': 'criminal-defense-attorneys', 
																		'Divorce Lawyers': 'divorce-lawyers',
																		'Essays Writing & Editing': 'essays-writing-and-editing', 
																		'Family Lawyers': 'family-lawyers',
																		'Immigration Lawyers': 'immigration-lawyers', 
																		'Lawyers': 'lawyer', 
																		'Notary Services': 'notary-services',
																		'Personal Driver': 'personal-driver', 
																		'Personal Injury Lawyers': 'personal-injury-lawyers',
																		'Private Detective': 'private-detective', 
																		'Resume Writing': 'resume-writing',
																		'Tax Preparation': 'tax-preparation', 
																		'Translation Services': 'translator',
																		'Writing & Editing': 'writing-editing-services'}],

				'Pet Services': ['service-pet-services', {'Aquarium Services': 'aquarium-services', 
															'Dog Training': 'dog-training', 
															'Horse Boarding': 'horse-boarding',
															'Horse Training': 'horse-training', 
															'Pet Daycare & Boarding': 'pet-daycare-boarding',
															'Pet Groomers': 'pet-groomer', 
															'Pet Sitters & Walkers': 'pet-sitting-and-walking',
															'Veterinary Services': 'veterinary'}],

				'Outdoor Contractors': ['service-outdoor-contractors', {'Chimney Services': 'chimney-services',
																			'Concrete Contractors': 'concrete-contractors', 
																			'Demolition Services': 'demolition-services',
																			'Fence Contractors': 'fence-contractors', 
																			'Fence Repair': 'fence-repair', 
																			'Firewood': 'firewood',
																			'Garbage Removal': 'garbage-removal', 
																			'Gardening': 'gardening', 
																			'Gutter Cleaning': 'gutter-cleaning',
																			'Gutter Installation & Repair': 'gutter-installation-and-repair', 
																			'Hardscape Contractors': 'hardscapers',
																			'Landscaping': 'landscaping', 
																			'Lawn Care': 'lawn-care', 
																			'Masonry Contractors': 'masonry-contractors',
																			'Pool Buildings': 'pool-buildings', 
																			'Pool Cleaners': 'pool-cleaners', 
																			'Pool Maintenance': 'pool-maintenance',
																			'Pressure Washing': 'pressure-washing', 
																			'Roof Cleaning': 'roof-cleaning', 
																			'Roofing Contractors': 'roofing',
																			'Roofing Installation & Repair': 'roofing-installation-and-repair', 
																			'Snow & Ice Removal': 'snow-ice-removal',
																			'Sprinkler Repairs': 'sprinkler-repairs', 
																			'Tree Services': 'tree-services', 
																			'Yard Clean-Up': 'yard-clean-up'}],

				'Housekeeping & Cleaning': ['service-housekeeping-cleaning', {'Apartment Cleaning': 'apartment-cleaning',
																				'Appliance Cleaning': 'appliance-cleaning', 
																				'Carpet Cleaning': 'carpet-cleaning',
                																'Commercial Cleaning': 'commercial-cleaning', 
                																'House Cleaning': 'house-cleaning',
                																'Housekeeping': 'housekeeping', 
                																'Janitorial Services': 'janitorial-services', 
                																'Maids': 'maids',
                																'Mattress Cleaning': 'mattress-cleaning', 
                																'Move Out Cleaning': 'move-out-cleaning',
                																'Office Cleaning': 'office-cleaning', 
                																'Upholstery Cleaning': 'upholstery-cleaning',
                																'Window Cleaning': 'window-cleaning'}],

				'Household': ['service-household', {'Animal Control': 'animal-control', 
														'Ant Control': 'ant-exterminators',
														'Appliance Repair & Installation': 'appliance-repair-installation', 
														'Bathroom Design': 'bathroom-designers',
														'Bed Bug Control': 'bed-bug-control', 
														'Cell Phone Repair': 'cell-phone-repair',
														'Closet Organization': 'closet-organizers', 
														'Computer Repair': 'computer-repair',
														'Computer Services': 'computer-services', 
														'Decorating': 'home-decorators',
														'Dry-cleaning, Laundry & Alteration': 'dry-cleaning-laundry-alteration',
														'Grocery Shopping & Delivery': 'grocery-shopping-delivery', 
														'Interior Designer': 'interior-designer',
														'Kitchen Design & Planning': 'kitchen-designers', 
														'Landscape Designers': 'landscape-designers',
														'Lighting Design Services': 'lighting-designers', 
														'Locksmith': 'locksmith', 
														'Moving': 'moving',
														'Pest Control': 'pest-control-services', 
														'Piano Movers': 'piano-movers',
														'Pool Table Movers': 'pool-table-movers', 
														'Rat Control': 'rat-control',
														'Security Installation': 'security-installation', 
														'Self Storage': 'self-storage',
														'Termite Control': 'termite-control', 
														'Virus Removal': 'virus-removal',
														'Wasp & Bee Removal': 'wasp-bee-removal'}],

				'Fasion & Beauty': ['service-fashion-beauty', {'Balayage': 'balayage-hair',
																	'Barbers': 'barbershop', 
																	'Box Braids': 'box-braids', 
																	'Crochet Braids': 'corchet-braids',
																	'Eyebrow Tinting': 'eyebrow-tinting', 
																	'Eyelash Extension': 'eyelash-extension', 
																	'Fashion Design': 'fashion-design',
																	'Hair Extensions': 'hair-extensions', 
																	'Hair Stylist': 'hair-stylist',
																	'Henna Tattoos Artist': 'henna-tattoos-artist', 
																	'Image Consultant': 'image-consultant',
																	'MakeUp Artist': 'makeup-artist', 
																	'Nail Services': 'nail-services', 
																	'Nutritionist': 'nutritionist',
																	'Permanent MakeUp': 'permanent-makeup', 
																	'Personal Stylist': 'personal-stylist',
																	'Personal Trainers': 'personal-trainers', 
																	'Sew in': 'sew-in', 
																	'Skin Care': 'skin-care', 
																	'Tailors': 'tailors',
																	'Tattoo Artist': 'tattoo-artist', 
																	'Wedding Hair & Makeup Artist': 'wedding-makeup-artist'}],

				'Events & Parties': ['service-events-and-parties', {'Bartenders': 'bartenders',
																		'Boudoir Photographers': 'boudoir-photographers',
																		'Bounce House Rentals': 'bounce-houses',
																		'Catering': 'catering',
																		'Commercial Photographers': 'commercial-photographers', 
																		'DJ & MC': 'dj-mc',
																		'Event Photographers': 'event-photographers', 
																		'Event Planning': 'event-planner',
																		'Face Painting': 'face-painting', 
																		'Family Photographers': 'family-photographers',
																		'Flower Delivery': 'flower-delivery', 
																		'Limo Services': 'limo-services',
																		'Party Entertainment': 'party-entertainment', 
																		'Party Equipment Rental': 'party-equipment-rental',
																		'Personal Chef': 'personal-chef', 
																		'Photographers': 'photographers',
																		'Portrait Photographers': 'portrait-photographers', 
																		'Promotional Video Services': 'promotional-video-service',
																		'Table & Chair Rentals': 'table-chair-rentals', 
																		'Videographers': 'videographers', 
																		'Wedding DJ': 'wedding-dj',
																		'Wedding Officiants': 'wedding-officiants', 
																		'Wedding Photography': 'wedding-photography',
																		'Wedding Planner': 'wedding-planners', 
																		'Wedding Videography': 'wedding-videography'}],

				'Construction': ['service-construction', {'Air Conditioner Installation': 'air-conditioner-installation', 
															'Air Duct Cleaning': 'air-duct-cleaning',
                											'Bathtub Installation & Replacement': 'bathtub-installation', 
                											'Carpenter': 'carpenter',
                											'Carpet Installation': 'carpet-installation', 
                											'Deck Building & Repair': 'deck-builder',
                											'Door Services': 'door-service', 
                											'Drain Cleaning': 'drain-cleaning', 
                											'Drywall Installation': 'drywall-installation', 
                											'Electrician': 'electrician',
                											'Exterior Door Installation': 'exterior-door-installation', 
                											'Flooring Contractors': 'flooring',
                											'Furniture Assembly & Repair': 'furniture-assembly-repair', 
                											'Garage Door Installation': 'garage-door-installation',
                											'Garage Door Repair': 'garage-door-repair', 
                											'General Contractors': 'general-contractors',
                											'Handyman': 'handyman', 
                											'Hardwood Flooring': 'hardwood-flooring', 
                											'Heating Installation': 'heating-installation',
                											'HVAC Repair': 'hvac-repair', 
                											'HVAC Services': 'hvac', 
                											'Laminate Flooring': 'laminate-flooring',
                											'Painting Contractors': 'painting-contractors', 
                											'Piano Tuning': 'piano-tuning', 
                											'Plumber': 'plumber',
                											'Remodeling Services': 'remodeling-services', 
                											'Spray Foam Insulation': 'spray-foam-insulation',
                											'Tile & Ceramic Flooring': 'tile-and-ceramic-flooring', 
                											'Tile Contractors': 'tile-contractors',
                											'TV Installation': 'tv-installation', 
                											'Vinyl & Linoleum Flooring': 'vinyl-and-linoleum-flooring',
                											'Water Heater Installation': 'water-heater-installation', 
                											'Water Heater Repair': 'water-heater-repair',
                											'Welding Services': 'welding-services', 
                											'Window Installation': 'window-installation',
                											'Window Repair': 'window-repair'}],

				'Automotive Services': ['service-automotive-services', {'Auto Locksmith': 'auto-locksmith',
																		'Auto Repair Services': 'auto-repair-services', 
																		'Auto Upholstery Repair': 'auto-upholstery-repair',
                														'Bicycle Repair': 'bicycle-repair', 
                														'Car Wash': 'car-wash', 
                														'Driving School': 'driving-school',
                														'Hoverboard & Segway Repair': 'hoverboard-segway-repair', 
                														'Lawn Equipment Repair': 'lawn-equipment-repair',
                														'Motorcycle Repair': 'motorcycle-repair', 
                														'Towing Services': 'towing-services'}]}"""

categories = {
				'Teaching & Caring': ['Babysitting', 'Beauty Schools', 'Caregiver', 'Chinese Lessons', 'Cooking Lessons', 
										'Dancing Lessons', 'Daycare', 'Drawing Classes', 'English Lessons', 'French Lessons', 
										'Horseback Riding', 'Italian Lessons', 'Japanese Lessons', 'Language Classes', 
										'MakeUp Lessons', 'Martial Arts', 'Music Lessons', 'Other Classes', 'Photography Classes', 
										'Piano Lessons', 'Portuguese Lessons', 'Private Tutoring', 'Russian Lessons',
										'Singing Lessons', 'Spanish Lessons', 'Sport Lessons', 'Surfing lessons', 
										'Swim lessons', 'Tennis lessons'],

				'Professional Services': ['Academic Writing', 'Bankruptcy Lawyers', 'Business Lawyers',
											'Civil Rights Lawyers', 'Copywriting', 'Criminal Defense Attorneys', 
											'Divorce Lawyers', 'Essays Writing & Editing', 'Family Lawyers', 
											'Immigration Lawyers', 'Lawyers', 'Notary Services', 'Personal Driver', 
											'Personal Injury Lawyers', 'Private Detective', 'Resume Writing', 'Tax Preparation', 
											'Translation Services', 'Writing & Editing'],

				'Pet Services': ['Aquarium Services', 'Dog Training', 'Horse Boarding', 'Horse Training',
								'Pet Daycare & Boarding', 'Pet Groomers', 'Pet Sitters & Walkers', 'Veterinary Services'],

				'Outdoor Contractors': ['Chimney Services', 'Concrete Contractors', 'Demolition Services',
										'Fence Contractors', 'Fence Repair', 'Firewood', 'Garbage Removal', 'Gardening', 
										'Gutter Cleaning', 'Gutter Installation & Repair', 'Hardscape Contractors',
										'Landscaping', 'Lawn Care', 'Masonry Contractors', 'Pool Buildings', 
										'Pool Cleaners', 'Pool Maintenance','Pressure Washing', 'Roof Cleaning', 
										'Roofing Contractors', 'Roofing Installation & Repair', 'Snow & Ice Removal',
										'Sprinkler Repairs', 'Tree Services', 'Yard Clean-Up'],

				'Housekeeping & Cleaning': ['Apartment Cleaning', 'Appliance Cleaning', 'Carpet Cleaning',
                							'Commercial Cleaning', 'House Cleaning', 'Housekeeping', 
                							'Janitorial Services', 'Maids', 'Mattress Cleaning', 'Move Out Cleaning',
                							'Office Cleaning', 'Upholstery Cleaning', 'Window Cleaning'],

				'Household': ['Animal Control', 'Ant Control', 'Appliance Repair & Installation', 
								'Bathroom Design', 'Bed Bug Control', 'Cell Phone Repair',
								'Closet Organization', 'Computer Repair', 'Computer Services', 
								'Decorating', 'Dry-cleaning, Laundry & Alteration',
								'Grocery Shopping & Delivery', 'Interior Designer',
								'Kitchen Design & Planning', 'Landscape Designers',
								'Lighting Design Services', 'Locksmith', 'Moving',
								'Pest Control', 'Piano Movers', 'Pool Table Movers', 
								'Rat Control', 'Security Installation', 'Self Storage',
								'Termite Control', 'Virus Removal', 'Wasp & Bee Removal'],

				'Fasion & Beauty': ['Balayage', 'Barbers', 'Box Braids', 'Crochet Braids', 'Eyebrow Tinting', 
									'Eyelash Extension', 'Fashion Design', 'Hair Extensions', 'Hair Stylist',
									'Henna Tattoos Artist', 'Image Consultant', 'MakeUp Artist', 
									'Nail Services', 'Nutritionist','Permanent MakeUp', 'Personal Stylist',
									'Personal Trainers', 'Sew in', 'Skin Care', 'Tailors', 'Tattoo Artist', 
									'Wedding Hair & Makeup Artist'],

				'Events & Parties': ['Bartenders', 'Boudoir Photographers','Bounce House Rentals', 'Catering',
										'Commercial Photographers', 'DJ & MC', 'Event Photographers', 
										'Event Planning', 'Face Painting', 'Family Photographers',
										'Flower Delivery', 'Limo Services', 'Party Entertainment', 
										'Party Equipment Rental', 'Personal Chef', 'Photographers',
										'Portrait Photographers', 'Promotional Video Services',
										'Table & Chair Rentals', 'Videographers', 'Wedding DJ',
										'Wedding Officiants', 'Wedding Photography', 'Wedding Planner', 
										'Wedding Videography'],

				'Construction': ['Air Conditioner Installation', 'Air Duct Cleaning',
                					'Bathtub Installation & Replacement', 'Carpenter', 'Carpet Installation', 
                					'Deck Building & Repair', 'Door Services', 'Drain Cleaning', 
                					'Drywall Installation', 'Electrician', 'Exterior Door Installation', 
                					'Flooring Contractors', 'Furniture Assembly & Repair', 'Garage Door Installation',
                					'Garage Door Repair', 'General Contractors', 'Handyman', 'Hardwood Flooring', 
                					'Heating Installation', 'HVAC Repair', 'HVAC Services', 'Laminate Flooring',
                					'Painting Contractors', 'Piano Tuning', 'Plumber', 'Remodeling Services', 
                					'Spray Foam Insulation', 'Tile & Ceramic Flooring', 'Tile Contractors',
                					'TV Installation', 'Vinyl & Linoleum Flooring', 'Water Heater Installation', 
                					'Water Heater Repair', 'Welding Services', 'Window Installation',
                					'Window Repair'],

				'Automotive Services': ['Auto Locksmith', 'Auto Repair Services', 'Auto Upholstery Repair',
                							'Bicycle Repair', 'Car Wash', 'Driving School',
                							'Hoverboard & Segway Repair', 'Lawn Equipment Repair',
                							'Motorcycle Repair', 'Towing Services']}


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

	def build(self):
		layout = GridLayout(cols=2)
		#for each in categories.keys():
		#	layout.add_widget(Button(text=each))
		return layout

	def cancel_button_func(self):
		#Clock.schedule_once(self.connect, 1)
		hirerush_app.screens.current = 'Welcome!'

	def lead_gen_func(self, category):
		#Clock.schedule_once(self.connect, 1)
		#hirerush_app.screens.current = 'What service do you need?'
		#for child in self.children:
		self.clear_widgets()
		self.category = category
		self.layout = AnchorLayout()
		with self.canvas:
			Color(rgba('#FFFFFF'))
			self.rect = Rectangle(size=(self.width, self.height))
		self.layout.add_widget(Label(text='text'))
		#grid = GridLayout(cols=1, padding=[50, 10, 50, 10], spacing=[10, 10], row_force_default=False, row_default_height=35)
		#self.layout.grid = grid
		for j in range(len(categories[category])):
			self.layout.add_widget(Button(text=str(list(categories[category])[j])))
			print(category)


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
		print(self.screens)

		#Signup_customer

		return self.screens

	categories = categories


if __name__ == '__main__':
	hirerush_app = MobileApp()
	hirerush_app.run()

