import  requests
import  json

BASE_URL = "http://localhost:8080"
token_path = "/api/auth/token"
user_path = "/api/users"

username = "test01"
password = "admin123"
firstname = 'test1'
lastname = 'customer'
phoneno = '123456'
update_firstname = 'testone'
update_lastname = 'member'
update_phoneno = '789654'

# Fetch Token
def get_token(): 
    token_url = f"{BASE_URL}{token_path}"

    resp = requests.get(token_url, auth=(username, password))
    
    assert resp.status_code == 200
    return json.loads(resp.text)['token']


def register_new_user():
    url = f"{BASE_URL}{user_path}"
    headers = {'Content-Type': 'application/json'}
    payload = {'username': username, 'password': password, 'firstname': firstname, 'lastname': lastname, 'phone': phoneno}

    resp = requests.post(url, headers=headers, data=json.dumps(payload,indent=4))

    response = resp.json()
    if resp.status_code == 201:
        assert response['status'] == "SUCCESS"
    else:
        print(response['message'])

    #verify user registration in system
    users_resp = get_registered_users()
    resp_body = users_resp.json()    
    assert username in resp_body['payload']


def get_registered_users():
    url = f"{BASE_URL}{user_path}"
    headers = {'Content-Type': 'application/json'}

    resp = requests.get(url, headers=headers)

    assert resp.status_code == 200
    return  resp

def get_user_info(name):
    url = f"{BASE_URL}{user_path}/{name}"
    headers = {'token': TOKEN}

    resp = requests.get(url, headers=headers)

    assert resp.status_code == 200
    return resp

def update_user_info(name):
    url = f"{BASE_URL}{user_path}/{name}"
    headers = {'token': TOKEN, 'Content-Type': 'application/json'}
    payload = {'firstname': update_firstname, 'lastname': update_lastname, 'phone': update_phoneno}

    resp = requests.put(url, headers=headers, data=json.dumps(payload))

    assert resp.status_code == 201
    
    # verify updated user info
    updated_info = get_user_info(name)
    resp_body = updated_info.json()
    assert resp_body['payload']['firstname'] == update_firstname
    assert resp_body['payload']['lastname'] == update_lastname
    assert resp_body['payload']['phone'] == update_phoneno
    assert resp_body['status'] == "SUCCESS"
    
    print(updated_info.text)


#Registering a new user, reviewing registered users in the system, and then updating and verifying user details in the system
register_new_user()
TOKEN = get_token()
print(json.loads(get_user_info(username).text))
update_user_info(username)