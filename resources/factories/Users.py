from faker import Faker
fake = Faker()

import bcrypt

def get_hash_password(password):
   hashed = bcrypt.hashpw(password.encode('utf-8'),bcrypt.gensalt(8))
   return hashed

def factory_user():
    user = {
        'name':fake.first_name(),
        'lastname':fake.last_name(),
        'email': fake.free_email(),
        'password': 'pwd123'
    }

    return user

def factory_wrong_email():
    first_name= fake.first_name()
    user = {
        'name':first_name,
        'lastname':first_name,
        'email': first_name + '&gmail.com',
        'password': 'pwd123'
    }

    return user

def factory_user_login():
    user = {
        'name':'Fernando',
        'lastname':'Papito',
        'email': 'papito@gmail.com',
        'password': 'pwd123'
    }

    return user