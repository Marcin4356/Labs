import requests

response = requests.get("https://gitlab.com/api/v4/users/ziomekpl88/projects")
my_projects = response.json()

for project in my_projects:
    print(f"Project Name: {project['name']}\n Project Url: {project['web_url']}\n")
